//
//  EMLSummarViewController.m
//  Email
//
//  Created by dy on 14-10-15.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import "EMLSummarViewController.h"

@interface EMLSummarViewController ()<UITableViewDataSource,
                                    UITableViewDelegate>
{
    
}

@property (nonatomic)UITableView *tableView;

@end

@implementation EMLSummarViewController
@synthesize tableView = _tableView;

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
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"收信" style:UIBarButtonItemStylePlain target:self action:@selector(receiveAction:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    [self.view addSubview:self.tableView];

}

#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"summarTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    return cell;
}



#pragma mark action响应
- (void)receiveAction:(UIBarButtonItem *)sender
{
    Pop3Client *popClient = [[Pop3Client alloc] init];
    [popClient request];
}

#pragma mark 属性
- (UITableView *)tableView
{
    if (!_tableView) {
        CGRect rect = self.view.bounds;
        _tableView = [[UITableView alloc] initWithFrame:rect];
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
