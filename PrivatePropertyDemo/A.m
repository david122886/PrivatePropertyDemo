//
//  A.m
//  PrivatePropertyDemo
//
//  Created by liudavid on 16/9/1.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "A.h"
@interface A()
@property (assign,nonatomic) int a;///和父类同名私有方法

@end
@implementation A

-(instancetype)init{
    self = [super init];
    if (self) {
//        self.a = @"A 类私有变量";
        _a = 111;
    }
    return self;
}
-(void)testA{
    NSLog(@"%d",_a);//1
    NSLog(@"%d",self.a);//2
    __weak typeof(self) weakSelf = self;
    void(^dd)() = ^(){
        typeof(self) ww = weakSelf;
        NSLog(@"%d",ww.a);//3
        NSLog(@"%d",ww->_a);//4
    };
    dd();
}

-(void)testProperty{
    [self testA];
}
-(int)a{
    return _a;
}

@end
