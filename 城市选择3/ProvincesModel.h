//
//  ProvincesModel.h
//  城市选择3
//
//  Created by 张城 on 16/5/12.
//  Copyright © 2016年 张城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvincesModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong)NSArray * cities;

-(instancetype)initWithDic:(NSDictionary*)dic;
+(instancetype)modelWithDic:(NSDictionary*)dic;
@end
