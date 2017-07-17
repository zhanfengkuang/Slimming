//
//  MapleCell.m
//  Sliming
//
//  Created by 邝战锋 on 2017/7/17.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "MapleCell.h"
#import "Model.h"

@interface MapleCell ()
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UILabel *name;
@end

@implementation MapleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _avatar = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 50)];
    [self.contentView addSubview:_avatar];
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 200, 50)];
    _name.textAlignment = NSTextAlignmentLeft;
    _name.textColor = [UIColor blackColor];
    [self.contentView addSubview:_name];
}

- (void)configureForData:(Model *)model {
    _name.text = model.name;
    _avatar.image = [UIImage imageNamed:model.picture];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
