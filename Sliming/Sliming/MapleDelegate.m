//
//  MapleDelegate.m
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "MapleDelegate.h"

@interface MapleDelegate ()
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, copy) TableViewCellSelectedBlock selectedBlock;
@end

@implementation MapleDelegate

- (instancetype)init {
    return nil;
}

- (instancetype)initWithHeight:(CGFloat)aHeight selectedBlock:(TableViewCellSelectedBlock)aSelectedBlock{
    self = [super init];
    if (self) {
        _height = aHeight;
        _selectedBlock = aSelectedBlock;
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_selectedBlock) {
        _selectedBlock (indexPath);
    }
}

@end









