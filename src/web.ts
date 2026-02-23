import { WebPlugin } from '@capacitor/core';
import type { MyShakePlugin } from './definitions';

export class MyShakeWeb extends WebPlugin implements MyShakePlugin {
  async addListener(eventName: string, listenerFunc: any): Promise<any> {
    if (eventName === 'shake') {
      if (typeof (DeviceMotionEvent as any).requestPermission === 'function') {
        const state = await (DeviceMotionEvent as any).requestPermission();
        if (state !== 'granted') throw new Error('Permission denied');
      }
      window.addEventListener('devicemotion', (event) => {
        const acc = event.accelerationIncludingGravity;
        if (acc) {
          const sensitivity = 15;
          if (Math.abs(acc.x || 0) > sensitivity || Math.abs(acc.y || 0) > sensitivity || Math.abs(acc.z || 0) > sensitivity) {
            this.notifyListeners('shake', {});
          }
        }
      });
    }
    return super.addListener(eventName, listenerFunc);
  }
}