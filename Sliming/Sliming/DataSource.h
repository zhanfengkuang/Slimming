//
//  DataSource.h
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface DataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)aItems
           identifier:(NSString *)aCellIdentifier
       configureBlock:(TableViewCellConfigureBlock)aConfigureBlock;

@end
