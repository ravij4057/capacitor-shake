import { WebPlugin } from '@capacitor/core';

import type { MyShakePlugin } from './definitions';

export class MyShakeWeb extends WebPlugin implements MyShakePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
