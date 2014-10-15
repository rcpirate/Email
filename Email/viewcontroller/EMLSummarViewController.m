//
//  EMLSummarViewController.m
//  Email
//
//  Created by dy on 14-10-15.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import "EMLSummarViewController.h"

@interface EMLSummarViewController ()

@end

@implementation EMLSummarViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"summar";
        
        //注意这段如果放在viewDidLoad里面，那么这个tab的图标不会立刻显示
        NSDictionary *titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        [self.tabBarItem setTitleTextAttributes:titleTextAttributes forState:
         UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Breifcase" ofType:@"png"];
        [self.tabBarItem setImage:[UIImage imageWithContentsOfFile:path]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLabel.text = self.title;
    titleLabel.font = [UIFont systemFontOfSize:24];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.center = self.navigationBar.center;
    self.navigationBar.barTintColor = [UIColor orangeColor];
    [self.navigationBar addSubview:titleLabel];
    
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
