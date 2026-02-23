#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Yeh macro Capacitor ko batata hai ki MyShakePlugin class exist karti hai
CAP_PLUGIN(MyShakePlugin, "MyShake",
           CAP_PLUGIN_METHOD(addListener, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(removeAllListeners, CAPPluginReturnNone);
)