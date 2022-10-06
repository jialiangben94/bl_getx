#import "BlGetxPlugin.h"
#if __has_include(<bl_getx/bl_getx-Swift.h>)
#import <bl_getx/bl_getx-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bl_getx-Swift.h"
#endif

@implementation BlGetxPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBlGetxPlugin registerWithRegistrar:registrar];
}
@end
