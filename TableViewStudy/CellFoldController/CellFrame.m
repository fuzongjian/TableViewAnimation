//
//  CellFrame.m
//  TableViewStudy
//
//  Created by 付宗建 on 16/9/6.
//  Copyright © 2016年 youran. All rights reserved.
//

#import "CellFrame.h"
#import "CellModel.h"
@implementation CellFrame
+ (NSMutableArray *)cellSourceWithName:(NSString *)sourceName{
    NSString * path = [[NSBundle mainBundle] pathForResource:sourceName ofType:@"json"];
    NSData * dataArray = [NSData dataWithContentsOfFile:path];
    NSArray * array = [NSJSONSerialization JSONObjectWithData:dataArray options:0 error:nil];
    NSMutableArray * endArray = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL * _Nonnull stop) {
        CellModel * model = [CellModel cellModelWithDict:dict];
        CellFrame * cellFrame = [[CellFrame alloc] init];
        cellFrame.cellModel = model;
        [endArray addObject:cellFrame];
    }];
    return endArray;
}
- (void)setCellModel:(CellModel *)cellModel{
    _cellModel = cellModel;
    
    CGFloat iconX = 15;
    CGFloat iconY = 10;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    self.iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGSize nameSize = [cellModel.name sizeWithFont:[UIFont systemFontOfSize:18] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameX = CGRectGetMaxX(self.iconF)+10;
    CGFloat nameY = iconY;
    self.nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    CGSize introSize;
    if(self.isOpened == YES){
        introSize = [cellModel.intro sizeWithFont:[UIFont boldSystemFontOfSize:16] maxSize:CGSizeMake(SCREEN_WIDTH -nameX - 10, MAXFLOAT)];
    }else{
        introSize = [cellModel.intro sizeWithFont:[UIFont boldSystemFontOfSize:16] maxSize:CGSizeMake(SCREEN_WIDTH -nameX - 10, 10)];
    }
    CGFloat introX = nameX;
    CGFloat introY = CGRectGetMaxY(self.nameF) +10;
    self.introF = CGRectMake(introX, introY, introSize.width, introSize.height);
    
    self.cellHeight = CGRectGetMaxY(self.introF)+10;
    
    CGFloat sepX = nameX;
    CGFloat sepH = 1.0;
    CGFloat sepY = self.cellHeight;
    CGFloat sepW = SCREEN_WIDTH - sepX;
    self.sepLineF = CGRectMake(sepX, sepY, sepW, sepH);
    
    CGFloat seeW = 23;
    CGFloat seeH = 23;
    CGFloat seeX = SCREEN_WIDTH - 33;
    CGFloat seeY = iconY;
    self.seeF = CGRectMake(seeX, seeY, seeW, seeH);
    
}
@end
