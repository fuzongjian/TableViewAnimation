//
//  CellModel.m
//  TableViewStudy
//
//  Created by 付宗建 on 16/9/6.
//  Copyright © 2016年 youran. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)cellModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
