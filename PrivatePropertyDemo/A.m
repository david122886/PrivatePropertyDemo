//
//  A.m
//  PrivatePropertyDemo
//
//  Created by liudavid on 16/9/1.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "A.h"
@interface A()
@property (strong,nonatomic) NSString *a;

@end
@implementation A

-(instancetype)init{
    self = [super init];
    if (self) {
//        self.a = @"A 类私有变量";
        _a = @"A 类私有变量";
    }
    return self;
}
-(void)testA{
    NSLog(@"%@",_a);//1
    NSLog(@"%@",self.a);//2
    __weak typeof(self) weakSelf = self;
    void(^dd)() = ^(){
        typeof(self) ww = weakSelf;
        NSLog(@"%@",ww.a);//3
        NSLog(@"%@",ww->_a);//4
    };
    dd();
}

-(void)testProperty{
    [self testA];
}
@end
