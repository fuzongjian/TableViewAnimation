//
//  CustomRollCell.m
//  TableViewStudy
//
//  Created by 付宗建 on 16/8/15.
//  Copyright © 2016年 youran. All rights reserved.
//

#import "CustomRollCell.h"

@implementation CustomRollCell
+ (instancetype)tableView:(UITableView *)tableView cellAnchorPoint:(CGPoint)anchorPoint cellAngle:(CGFloat)angle{
    CustomRollCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    //动画设置
    CATransform3D transform = CATransform3DMakeRotation(angle, 0.0, 0.5, 0.3);
    transform.m34 = -1.0/500.0; // 设置透视效果
    cell.layer.transform = transform;
    
    cell.layer.anchorPoint = anchorPoint;
    
    [UIView animateWithDuration:0.6 animations:^{
        
        cell.layer.transform = CATransform3DIdentity;
    }];
    return cell;
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
