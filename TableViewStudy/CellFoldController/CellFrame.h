//
//  CellFrame.h
//  TableViewStudy
//
//  Created by 付宗建 on 16/9/6.
//  Copyright © 2016年 youran. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CellModel;
@interface CellFrame : NSObject
@property (nonatomic,strong) CellModel * cellModel;
@property (nonatomic,assign) CGRect  nameF;
@property (nonatomic,assign) CGRect  introF;
@property (nonatomic,assign) CGRect  iconF;
@property (nonatomic,assign) CGRect  sepLineF;
@property (nonatomic,assign) CGRect  seeF;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic, assign, getter = isOpened) BOOL opened;
+ (NSMutableArray *)cellSourceWithName:(NSString *)sourceName;
@end
