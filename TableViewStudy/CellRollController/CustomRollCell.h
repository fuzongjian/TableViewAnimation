//
//  CustomRollCell.h
//  TableViewStudy
//
//  Created by 付宗建 on 16/8/15.
//  Copyright © 2016年 youran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomRollCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

+ (instancetype)tableView:(UITableView *)tableView cellAnchorPoint:(CGPoint)anchorPoint cellAngle:(CGFloat)angle;
@end
