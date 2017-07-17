//
//  MapleDelegate.h
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellSelectedBlock)(NSIndexPath *indexPath);
@interface MapleDelegate : NSObject <UITableViewDelegate>

- (instancetype)initWithHeight:(CGFloat)aHeight
                 selectedBlock:(TableViewCellSelectedBlock)aSelectedBlock;

@end
