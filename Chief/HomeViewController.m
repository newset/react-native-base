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
    [super viewDidLoad];
        // 此处只是使用加载本地的bundle的方式，如果是在线的方式，可以先使用http下载然后加载本地
    [Yard.instance
     loadBusinessBundle:@"modules/index"
     moduleName:@"RNHighScores"
     callback:^(BOOL succeed) {
        if (succeed) {
            RCTRootView *rootView = [[RCTRootView alloc]
                                     initWithBridge:Yard.instance.commonBridge
                                     moduleName:@"RNHighScores"
                                     initialProperties:nil];
            self.view = rootView;
        }
        NSLog(@"%d", succeed);
    }];
}

@end
