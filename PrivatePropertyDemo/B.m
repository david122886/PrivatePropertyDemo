//
//  B.m
//  PrivatePropertyDemo
//
//  Created by liudavid on 16/9/1.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "B.h"
@interface B()
@property (strong,nonatomic) NSString *a;///和父类同名私有方法
@end

@implementation B

-(instancetype)init{
    self = [super init];
    if (self) {
        _a = @"B 类私有变量";
    }
    return self;
}
-(NSString*)getA{
    return _a;
}
@end
