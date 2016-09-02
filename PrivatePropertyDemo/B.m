//
//  B.m
//  PrivatePropertyDemo
//
//  Created by liudavid on 16/9/1.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "B.h"
@interface B()
//@property (strong,nonatomic) NSString *a;///和父类同名私有方法
@end

@implementation B{
    @public
    int _a;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _a = 222;
    }
    return self;
}
//-(NSString*)a{
//    return _a;
//}
@end
