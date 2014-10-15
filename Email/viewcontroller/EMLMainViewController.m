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
        
        EMLMineViewController *mineViewController = [[EMLMineViewController alloc] init];
        
//        self.viewControllers = @[summarViewController,mineViewController];
        [self setViewControllers:@[summarViewController,mineViewController] animated:NO];
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
