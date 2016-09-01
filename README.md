# 正确定义私有变量
***
##先上一个典型例子
1. 先创建一个父类A.h：
```
#import <Foundation/Foundation.h>

@interface A : NSObject
-(void)testProperty;
@end
```


创建一个公有方法接口 
> -(void)testProperty

2.有一个私有属性a A.m:
```
'#import "A.h"
@interface A()
@property (strong,nonatomic) NSString *a;//5

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
```
3.创建子类B.h:
```
#import <Foundation/Foundation.h>
#import "A.h"
@interface B : A

@end
```
4.创建一个和父类同名私有属性a B.m
```
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
```
5.创建B对象，并调用继承来的
> -(void)testProperty

```
#import "ViewController.h"
#import "B.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
[super viewDidLoad];
B *testB = [B new];
[testB testProperty];
// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

@end
```
打印结果
> 2016-09-01 15:52:47.378 PrivatePropertyDemo[5736:245091] A 类私有变量
> 2016-09-01 15:52:47.379 PrivatePropertyDemo[5736:245091] B 类私有变量
> 2016-09-01 15:52:47.379 PrivatePropertyDemo[5736:245091] B 类私有变量
> 2016-09-01 15:52:47.379 PrivatePropertyDemo[5736:245091] A 类私有变量