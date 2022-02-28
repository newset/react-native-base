//
//  Yard.h
//  Chief
//
//  Created by Doctorwork on 2021/11/8.
//


#import <Foundation/Foundation.h>
#import "RCTBridge+Extension.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    RNBundleLoadStatus_Init = 0,
    RNBundleLoadStatus_Loading = 1,
    RNBundleLoadedStatus_Successed = 2,
    RNBundleLoadStatus_Failed = 3
} RNBundleLoadStatus;

typedef void(^RNBusinessLoadCallback)(BOOL succeed);


@interface Yard : NSObject<RCTBridgeDelegate>

@property (nonatomic, strong) RCTBridge *commonBridge;

@property(nonatomic,strong) NSMutableArray *loadedScripts;

@property(nonatomic,assign) RNBundleLoadStatus commonStatus;

- (void) loadBaseBundleWithLaunchOptions:(nullable NSDictionary *)launchOptions;

- (void)loadBusinessBundle:(NSString*)path moduleName:(NSString*) moduleName callback:(RNBusinessLoadCallback) callback;

+(instancetype)instance;

@end

NS_ASSUME_NONNULL_END
