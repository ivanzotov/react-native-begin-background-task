#import <UIKit/UIKit.h>
#import "RNBeginBackgroundTask.h"

@implementation RNBeginBackgroundTask

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(begin, beginWithResolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  UIBackgroundTaskIdentifier identifier = UIBackgroundTaskInvalid;
  identifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
    [[UIApplication sharedApplication] endBackgroundTask:identifier];
  }];
  resolve([NSNumber numberWithUnsignedInteger:identifier]);
}

RCT_REMAP_METHOD(end, withIdentifier:(NSUInteger)identifier resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  [[UIApplication sharedApplication] endBackgroundTask:identifier];
  resolve(@[[NSNull null]]);
}

RCT_REMAP_METHOD(remaining, remainingWithResolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  resolve([NSNumber numberWithDouble:[[UIApplication sharedApplication] backgroundTimeRemaining]]);
}

@end
