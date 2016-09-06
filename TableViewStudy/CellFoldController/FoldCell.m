//
//  FoldCell.m
//  TableViewStudy
//
//  Created by 付宗建 on 16/9/6.
//  Copyright © 2016年 youran. All rights reserved.
//

#import "FoldCell.h"
#import "CellFrame.h"
#import "CellModel.h"
@interface FoldCell ()
@property (nonatomic, weak) UIImageView *headIcon;

@property (nonatomic, weak) UILabel *nameLab;

@property (nonatomic, weak) UILabel *introLab;

@property (nonatomic, weak) UIView *sepLine;

@property (nonatomic, weak) UIImageView *seeView;
@end
@implementation FoldCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configFoldCellUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)configFoldCellUI{
    UIImageView *headIcon = [[UIImageView alloc] init];
    headIcon.opaque = YES;
    self.headIcon = headIcon;
    [self.contentView addSubview:headIcon];
    
    UILabel *nameLab = [[UILabel alloc] init];
    nameLab.opaque = YES;
    nameLab.font = [UIFont boldSystemFontOfSize:18];
    self.nameLab = nameLab;
    [self.contentView addSubview:nameLab];
    
    UILabel *introLab = [[UILabel alloc] init];
    introLab.numberOfLines = 0;
    introLab.opaque = YES;
    introLab.font = [UIFont boldSystemFontOfSize:16];
    introLab.textColor = [UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0];
    self.introLab = introLab;
    [self.contentView addSubview:introLab];
    
    UIImageView *seeView = [[UIImageView alloc] init];
    seeView.contentMode = UIViewContentModeScaleAspectFit;
    seeView.image = [UIImage imageNamed:@"group_pay_arrow"];
    self.seeView = seeView;
    [self.contentView addSubview:seeView];
    
    UIView *sepLine = [[UIView alloc] init];
    sepLine.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:231/255.0 alpha:1.0];
    self.sepLine = sepLine;
    [self.contentView addSubview:sepLine];
}
- (void)setCellFrame:(CellFrame *)cellFrame{
    _cellFrame = cellFrame;
    [self setupFrame];
    [self setupContent];
}
- (void)setupFrame{
    self.headIcon.frame = self.cellFrame.iconF;
    self.introLab.frame = self.cellFrame.introF;
    self.nameLab.frame = self.cellFrame.nameF;
    self.sepLine.frame = self.cellFrame.sepLineF;
    self.seeView.frame = self.cellFrame.seeF;
    if (self.cellFrame.isOpened) {
        self.seeView.transform = CGAffineTransformMakeRotation(-M_PI);
    }else{
        self.seeView.transform = CGAffineTransformIdentity;
    }
}
- (void)setupContent{
    CellModel * cellModel = self.cellFrame.cellModel;
    self.headIcon.image = [UIImage imageNamed:cellModel.icon];
    self.nameLab.text = cellModel.name;
    self.introLab.text = cellModel.intro;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.headIcon.layer.cornerRadius = self.headIcon.width * 0.5;
    self.headIcon.layer.masksToBounds = YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
