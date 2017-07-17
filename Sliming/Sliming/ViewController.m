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

static NSString *const cellIdentifier = @"mapleCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DataSource *dataSource;
@property (nonatomic, strong) NSMutableArray *cellArray;

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
        [cell configureForData:item];
    }];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = _dataSource;
    [_tableView registerClass:[MapleCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
