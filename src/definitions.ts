import type { PluginListenerHandle, ListenerCallback } from '@capacitor/core';

export interface MyShakePlugin {
  addListener(eventName: 'shake', listenerFunc: ListenerCallback): Promise<PluginListenerHandle>;
  removeAllListeners(): Promise<void>;
}