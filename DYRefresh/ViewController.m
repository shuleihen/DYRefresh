//
//  ViewController.m
//  DYRefresh
//
//  Created by zdy on 2017/3/24.
//  Copyright © 2017年 lianlianpay. All rights reserved.
//

#import "ViewController.h"
#import "DYRefresh.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DYRefresh *refresh;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _refresh = [[DYRefresh alloc] initWithScrollView:self.tableView];
    [self.tableView addSubview:_refresh];
    
    [_refresh addTarget:self action:@selector(refreshAction)];
}

- (void)refreshAction {
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 4*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [_refresh endRefresh];
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"row%ld",indexPath.row];
    return cell;
}

@end
