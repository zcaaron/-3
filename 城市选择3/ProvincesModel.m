//
//  ProvincesModel.m
//  城市选择3
//
//  Created by 张城 on 16/5/12.
//  Copyright © 2016年 张城. All rights reserved.
//

#import "ProvincesModel.h"

@implementation ProvincesModel
-(instancetype)initWithDic:(NSDictionary*)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)modelWithDic:(NSDictionary*)dic{
    return [[self alloc]initWithDic:dic];
}
@end
