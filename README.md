# @ravij4057/capacitor-shake

A high-performance, cross-platform shake gesture detection plugin for Capacitor 6+. Features native-optimized event hooks for iOS and Android with full mobile browser support and intelligent battery management.

## Install

```bash
npm install @ravij4057/capacitor-shake
npx cap sync
```

## API

<docgen-index>

* [`addListener('shake', ...)`](#addlistenershake-)
* [`removeAllListeners()`](#removealllisteners)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### addListener('shake', ...)

```typescript
addListener(eventName: 'shake', listenerFunc: (data: any) => void) => Promise<PluginListenerHandle>
```

Listen for shake events.

| Param              | Type                                |
| ------------------ | ----------------------------------- |
| **`eventName`**    | <code>'shake'</code>                |
| **`listenerFunc`** | <code>(data: any) =&gt; void</code> |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt;</code>

--------------------


### removeAllListeners()

```typescript
removeAllListeners() => Promise<void>
```

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
