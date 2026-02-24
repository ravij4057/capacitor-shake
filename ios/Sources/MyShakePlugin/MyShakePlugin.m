#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Class: MyShakePlugin, JS Name: MyShake
CAP_PLUGIN(MyShakePlugin, "MyShake",
           CAP_PLUGIN_METHOD(addListener, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(removeAllListeners, CAPPluginReturnNone);
)