//
//  Model.m
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithName:(NSString *)aName picture:(NSString *)aPicture {
    self = [super init];
    if (self) {
        _name = aName;
        _picture = aPicture;
    }
    return self;
}

@end
