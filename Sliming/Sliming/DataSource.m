//
//  DataSource.m
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "DataSource.h"
#import "MapleCell.h"

@class Model;
@interface DataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureBlock;

@end

@implementation DataSource

- (id)init {
    return nil;
}

- (instancetype)initWithItems:(NSArray *)aItems identifier:(NSString *)aCellIdentifier configureBlock:(TableViewCellConfigureBlock)aConfigureBlock {
    self = [super init];
    if (self) {
        _items = aItems;
        _cellIdentifier = aCellIdentifier;
        _configureBlock = aConfigureBlock;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    id item = _items[indexPath.row];
    //其实把配置数据放在这里应该viewController的代码量会更少吧
    [(MapleCell *)cell configureForData:(Model *)item];
    if (_configureBlock) {
//        _configureBlock(cell, item);
    }
    return cell;
}

@end
