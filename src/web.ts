import { WebPlugin } from '@capacitor/core';
import type { MyShakePlugin } from './definitions';

export class MyShakeWeb extends WebPlugin implements MyShakePlugin {
  private lastShakeTime = 0;
  private cooldown = 2000;

  async addListener(eventName: string, listenerFunc: any): Promise<any> {
    if (eventName === 'shake') {
      window.addEventListener('devicemotion', (event) => {
        const acc = event.accelerationIncludingGravity;
        if (acc) {
          const threshold = 15;
          const now = Date.now();
          
          if (Math.abs(acc.x || 0) > threshold || Math.abs(acc.y || 0) > threshold) {
            if (now - this.lastShakeTime > this.cooldown) {
              this.lastShakeTime = now;
              this.notifyListeners('shake', {});
            }
          }
        }
      });
    }
    return super.addListener(eventName, listenerFunc);
  }
}