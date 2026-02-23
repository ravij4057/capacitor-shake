import { WebPlugin } from '@capacitor/core';
import type { MyShakePlugin } from './definitions';

export class MyShakeWeb extends WebPlugin implements MyShakePlugin {
  constructor() {
    super();
  }

  async addListener(eventName: string, listenerFunc: any): Promise<any> {
    if (eventName === 'shake') {
      if (typeof (DeviceMotionEvent as any).requestPermission === 'function') {
        const permissionState = await (DeviceMotionEvent as any).requestPermission();
        if (permissionState !== 'granted') {
          throw new Error('DeviceMotion permission denied');
        }
      }
      window.addEventListener('devicemotion', (event) => {
        const acceleration = event.accelerationIncludingGravity;
        if (acceleration) {
          const threshold = 15;
          if (
            Math.abs(acceleration.x || 0) > threshold ||
            Math.abs(acceleration.y || 0) > threshold ||
            Math.abs(acceleration.z || 0) > threshold
          ) {
            this.notifyListeners('shake', {});
          }
        }
      });
    }
    return super.addListener(eventName, listenerFunc);
  }
}