//
//  ViewController.m
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h"
#import "MapleCell.h"
#import "Model.h"
#import "DetailViewController.h"
#import "MapleDelegate.h"

static NSString *const cellIdentifier = @"mapleCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DataSource *dataSource;
@property (nonatomic, strong) NSMutableArray *cellArray;
@property (nonatomic, strong) MapleDelegate *delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cellArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 15; i++) {
        Model *model = [[Model alloc] initWithName:@"maple" picture:@"maple"];
        [_cellArray addObject:model];
    }
    [self setup];
}

#pragma mark - initialization
- (void)setup {
    _dataSource = [[DataSource alloc] initWithItems:_cellArray identifier:cellIdentifier configureBlock:^(id cell, id item) {
        //在这里写有什么意义吗 ~ ~ ~
        //应该是DataSource中不需要知道cell类，所以在这里设置了
        
        //可以做额外的配置，我还获取到了cell的索引
        [cell configureForData:item];
    }];
    __weak typeof(self) weakSelf = self;
    _delegate = [[MapleDelegate alloc] initWithHeight:70.f selectedBlock:^(NSIndexPath *indexPath) {
        [weakSelf.navigationController pushViewController:[[DetailViewController alloc] init] animated:YES];
    }];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //要想进一步slimming也可以把delegate放到单独的类中
//    _tableView.delegate = self;
    _tableView.delegate = _delegate;
    _tableView.dataSource = _dataSource;
    [_tableView registerClass:[MapleCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:_tableView];
}

//#pragma mark - UITableViewDelegate
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self.navigationController pushViewController:[[DetailViewController alloc] init] animated:YES];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 70.f;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
