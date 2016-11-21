//
//  HLAutoHeightCellTableViewCell.m
//  TableViewAutoRowHeightDemo
//
//  Created by 刘宏立 on 2016/11/20.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "HLAutoHeightCellTableViewCell.h"
#import <Masonry.h>

@interface HLAutoHeightCellTableViewCell()

@end

@implementation HLAutoHeightCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置界面
- (void)setupUI {
    
    UIImage *image = [UIImage imageNamed:@"028"];
    UIImageView *iv = [[UIImageView alloc]initWithImage:image];
    
    [self.contentView addSubview:iv];
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(15);
        make.width.height.mas_equalTo(80);
    }];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:14];
    
    label.text = @"这是一个严肃而庄重的问题,因为它直接和我们的工资水平挂钩,要想成为一个开发者,必须学会自动行高的布局,不然,寸步难行,自动行高,必须对cell.contentView进行布局,不然,cell.contentView就是一个死的,想办法参照一个控件,对其进行合理布局,赶快实验,不然你永远不知道咋回事,练练练,恋恋恋,技术是练出来的";
    
    [self.contentView addSubview:label];
    
    
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iv.mas_top);
        make.left.equalTo(iv.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-10); // 这里一定也得是self,也就是cell, 因为这是下一步self.contentView布局时所参照的视图 label,如果label不是布局 self.contentView时的参考视图则可以用self.contentView,切记.
    }];
    
    label.numberOfLines = 0;
    
    
    // 这是自动布局的关键代码,我们这里所参考的视图必须有参考self,也就是 cell 本身的,不然无法完成布局
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self); //这个一定以self,也就是以cell为参考视图
        make.bottom.equalTo(label.mas_bottom).offset(10);
    }];
    
    
    // 以下代码是当我们加载不同的数据时会产生不同的情况而使用的,例如本Demo中:1.图像的高度大于文本的高度.  2.也可能文本的高度大于图像的高度
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.right.left.equalTo(self);
//        make.bottom.greaterThanOrEqualTo(label.mas_bottom).offset(10);
//        make.bottom.greaterThanOrEqualTo(iv.mas_bottom).offset(10);
//    }];
}



@end
