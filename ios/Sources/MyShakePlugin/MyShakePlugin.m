#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Pehla parameter: MyShakePlugin (Swift class name)
// Dusra parameter: MyShake (JS registerPlugin name)
CAP_PLUGIN(MyShakePlugin, "MyShake",
           CAP_PLUGIN_METHOD(addListener, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(removeAllListeners, CAPPluginReturnNone);
)