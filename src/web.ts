import { WebPlugin } from '@capacitor/core';
import type { PluginListenerHandle, ListenerCallback } from '@capacitor/core';
import type { MyShakePlugin } from './definitions';

export class MyShakeWeb extends WebPlugin implements MyShakePlugin {
  private threshold = 15;
  private lastUpdate = 0;
  private lastX: number | null = null;
  private lastY: number | null = null;
  private lastZ: number | null = null;

  // Change: Use ListenerCallback and return Promise<PluginListenerHandle>
  async addListener(
    eventName: 'shake',
    listenerFunc: ListenerCallback, 
  ): Promise<PluginListenerHandle> {
    
    // iOS Safari 13+ Permission logic
    if (typeof (DeviceMotionEvent as any).requestPermission === 'function') {
      const state = await (DeviceMotionEvent as any).requestPermission();
      if (state !== 'granted') {
        throw new Error('DeviceMotion permission denied');
      }
    }

    window.addEventListener('devicemotion', (ev) => this.handleMotion(ev), false);
    
    // Call the base class addListener
    return super.addListener(eventName, listenerFunc);
  }

  private handleMotion(event: DeviceMotionEvent) {
    const acc = event.accelerationIncludingGravity;
    if (!acc || acc.x === null || acc.y === null || acc.z === null) return;

    const now = Date.now();
    if ((now - this.lastUpdate) > 100) {
      const diffTime = now - this.lastUpdate;
      this.lastUpdate = now;

      if (this.lastX !== null) {
        // Simple shake math
        const delta = Math.abs(acc.x + acc.y + acc.z - this.lastX - this.lastY! - this.lastZ!) / diffTime * 10000;
        
        if (delta > this.threshold) {
          // Notify with an empty object to satisfy the callback
          this.notifyListeners('shake', {});
        }
      }

      this.lastX = acc.x; 
      this.lastY = acc.y; 
      this.lastZ = acc.z;
    }
  }

  async removeAllListeners(): Promise<void> {
    window.removeEventListener('devicemotion', (ev) => this.handleMotion(ev));
    await super.removeAllListeners();
  }
}