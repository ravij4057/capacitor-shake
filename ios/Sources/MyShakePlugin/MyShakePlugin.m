#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(MyShakePlugin, "MyShake",
           CAP_PLUGIN_METHOD(addListener, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(removeAllListeners, CAPPluginReturnNone);
)