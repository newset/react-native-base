//
//  RCTBridge.h
//  Chief
//
//  Created by Doctorwork on 2021/11/8.
//

#import <React/RCTBridge+Private.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTBridge (Extension)
-(void)executeSourceCode:(NSData *)sourceCode sync:(BOOL)sync;
@end

NS_ASSUME_NONNULL_END
