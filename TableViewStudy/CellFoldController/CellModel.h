//
//  CellModel.h
//  TableViewStudy
//
//  Created by 付宗建 on 16/9/6.
//  Copyright © 2016年 youran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * intro;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)cellModelWithDict:(NSDictionary *)dict;
@end
