//
//  EMLMineViewController.m
//  Email
//
//  Created by dy on 14-10-15.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import "EMLMineViewController.h"

@interface EMLMineViewController ()

@end

@implementation EMLMineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"me";
        NSDictionary *titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                              NSBackgroundColorAttributeName:[UIColor blackColor]};
        [self.tabBarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Brightness" ofType:@"png"];
        [self.tabBarItem setImage:[UIImage imageWithContentsOfFile:path]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
