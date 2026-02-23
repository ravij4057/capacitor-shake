import { registerPlugin } from '@capacitor/core';
import type { MyShakePlugin } from './definitions';

const MyShake = registerPlugin<MyShakePlugin>('MyShake', {
  web: () => import('./web').then(m => new m.MyShakeWeb()),
});

export * from './definitions';
export { MyShake };