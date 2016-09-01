# 正确定义私有变量
***
##先上一个典型例子
1. 先创建一个父类A.h：
'#import <Foundation/Foundation.h>'

'@interface A : NSObject'
'-(void)testProperty;'
'@end'

创建一个公有方法接口 >-(void)testProperty
2. A.m:
'#import "A.h"
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
@end'