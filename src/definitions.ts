import type { PluginListenerHandle } from '@capacitor/core';

export interface MyShakePlugin {
  /**
   * Listen for shake events.
   */
  addListener(
    eventName: 'shake',
    listenerFunc: (data: any) => void, // Add data: any here
  ): Promise<PluginListenerHandle>;
  
  removeAllListeners(): Promise<void>;
}