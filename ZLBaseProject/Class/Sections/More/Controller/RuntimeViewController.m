//
//  RuntimeViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/10/8.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "RuntimeViewController.h"

@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    Person *p = [Person person];
    
    NSLog(@"==%@",p);
    
    Class perSonClass = p.class;
    unsigned int outCount = 0;
    
    //遍历实例变量
    Ivar *ivarPtr =  class_copyIvarList(perSonClass, &outCount);//返回一个列表
    for (int i = 0; i < outCount; i++) {
        
        Ivar ivar = ivarPtr[i];
        
        NSLog(@"实例变量:%s",ivar_getName(ivar));
        
    }
    
    //遍历属性列表
    objc_property_t *propertyPtr =  class_copyPropertyList(perSonClass, &outCount);//返回一个列表
    for (int i = 0; i < outCount; i++) {
        
        objc_property_t property = propertyPtr[i];
        
        NSLog(@"属性:%s",property_getName(property));
        
    }
    
    //遍历对象方法
    Method *methodPtr =  class_copyMethodList(perSonClass, &outCount);//返回一个列表
    for (int i = 0; i < outCount; i++) {
        
        Method method  = methodPtr[i];
        
        SEL selector = method_getName(method);
        
        NSLog(@"方法:%@",NSStringFromSelector(selector));
        
    }
    
    [p setAge:10];
    NSLog(@"A----%ld",p.age);
    objc_msgSend(p, @selector(setAge:),15);
    NSLog(@"B----%ld",p.age);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
