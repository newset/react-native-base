//
//  HomeViewController.m
//  Chief
//
//  Created by Doctorwork on 2021/11/15.
//


#import "Yard.h"
#import "HomeViewController.h"
#import <React/RCTRootView.h>

@implementation HomeViewController

//- (instancetype)init {
//
//}

- (void)viewDidLoad {
    
//    self.nameAlias = @"clinic";
    
    [super viewDidLoad];
        // 此处只是使用加载本地的bundle的方式，如果是在线的方式，可以先使用http下载然后加载本地
//    [Yard.instance
//     loadBusinessBundle:@"JSBundle/modules/index.ios"
//     moduleName:@"RNHighScores"
//     callback:^(BOOL succeed) {
//        if (succeed) {
//            RCTRootView *rootView = [[RCTRootView alloc]
//                                     initWithBridge:Yard.instance.commonBridge
//                                     moduleName:@"RNHighScores"
//                                     initialProperties:nil];
//            self.view = rootView;
//        }
//        NSLog(@"%d", succeed);
//    }];
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/modules/index.bundle?platform=ios"];
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"RNHighScores"
                         initialProperties:
     @{
        @"scores" : @[
            @{
                @"name" : @"Alex",
                @"value": @"42"
            },
            @{
                @"name" : @"Joel",
                @"value": @"10"
            }
        ]
    }
                             launchOptions: nil];
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view = rootView;
    self.view = rootView;
//    [self presentViewController:vc animated:YES completion:nil];
}

@end
