//
//  RootTableViewCell.m
//  basicFramework
//
//  Created by LiuLei on 2017/2/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    }
    return self;
}

- (void)setupViews{}

- (void)bindViewModel:(id)viewModel{

}


@end
