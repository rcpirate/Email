//
//  EMLMainViewController.m
//  Email
//
//  Created by dy on 14-10-15.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import "EMLMainViewController.h"
#import "EMLSummarViewController.h"
#import "EMLMineViewController.h"


@interface EMLMainViewController ()

@end

@implementation EMLMainViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"emailor";
        
        EMLSummarViewController *summarViewController = [[EMLSummarViewController alloc] init];
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:summarViewController];
        
        EMLMineViewController *mineViewController = [[EMLMineViewController alloc] init];
        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:mineViewController];
        
        [self setViewControllers:@[nav1,nav2] animated:NO];
//        self.selectedIndex = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

@end
