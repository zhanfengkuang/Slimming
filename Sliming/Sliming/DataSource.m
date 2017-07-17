//
//  DataSource.m
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "DataSource.h"

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
    if (!cell) {
        
    }
    
    id item = _items[indexPath.row];
    if (_configureBlock) {
        _configureBlock(cell, item);
    }
    return cell;
}

@end
