//
//  GCD_ViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/3/8.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

/**
 队列   queue
 任务   Operation
 
 将任务添加到队列中
 */

/**
 1.串行同步   不会开启新的线程,串行执行 （）
 2.串行异步   会开启线程，但是只开一条线程,队列中的任务串行执行
 
 3.并行同步   不会开启新的线程，并发队列失去了并发的功能,串行执行
 4.并行异步   ＊＊会开子线程,多条,队列中的任务并发执行
 */
#import "GCD_ViewController.h"

@interface GCD_ViewController ()

@end

@implementation GCD_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*******************串行队列 同步执行************************/
//总结：不会开启新的线程,串行执行
- (IBAction)serialQueueSync:(id)sender {
    
    //1.创建一个串行队列
    dispatch_queue_t queue=dispatch_queue_create("FirstSerialQueue", DISPATCH_QUEUE_SERIAL);
    //2.提交任务到队列中（block）
    //3.同步执行任务
    
    dispatch_sync(queue, ^{
        //逻辑任务
        //第一个任务
        for ( int i = 0;  i < 3; i++) {
            [NSThread sleepForTimeInterval:1];//睡眠1秒
            NSLog(@"+++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    
    //第二个任务
    dispatch_sync(queue, ^{
        for ( int i = 0;  i < 3; i++) {
            [NSThread sleepForTimeInterval:1];//睡眠1秒
            NSLog(@"-------------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
    
}

/********************串行队列 异步执行***************************/
//总结：会开启线程，但是只开一条线程,队列中的任务串行执行
- (IBAction)serialQueueAsync:(id)sender {
    
    dispatch_queue_t queue=dispatch_queue_create("SecondSerialQueue", DISPATCH_QUEUE_SERIAL);
    //异步执行任务
    dispatch_async(queue, ^{
        //第一个任务
        for (int  i = 0; i < 3; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个任务打印完毕%@",[NSThread currentThread]);
    
    dispatch_async(queue, ^{
        //第二个任务
        for (int  i = 0; i < 3; i++) {
            [NSThread sleepForTimeInterval:1 ];
            NSLog(@"------------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕%@",[NSThread currentThread]);
}


/**********************并行队列 同步执行********************************/
//总结：不会开启新的线程，并发队列失去了并发的功能,串行执行
- (IBAction)concurrentQueueSync:(id)sender {
    
    dispatch_queue_t queue=dispatch_queue_create("FirstConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3 ; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"------------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}


/***************并行队列 异步执行**********************/
//总结：会开子线程,多条,队列中的任务并发执行
- (IBAction)concurrentQueueAsync:(id)sender {
    
    dispatch_queue_t queue=dispatch_queue_create("SecondConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3 ; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"------------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}

/******************全局队列 异步执行****************************/
//他是特殊的并行队列，所以和并行队列异步执行一模一样
- (IBAction)globalQueueAsync:(id)sender {
    
    //获取系统默认创建的全局队列(参数1：给定队列的优先级)
    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //提交任务到全局队列中
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            [NSThread sleepForTimeInterval:1 ];
            NSLog(@"++++++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"i打印完毕");
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 3; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"-----------------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
    
}

/************************主队列 异步执行*************************/
- (IBAction)mainQueueAsync:(id)sender {
    
    //注意：所有主队列中的任务都是由主线程完成
    //获取系统默认的创建好的队列
    dispatch_queue_t queue= dispatch_get_main_queue();
    //提交任务到主队列中
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 3; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            [NSThread sleepForTimeInterval:1 ];
            NSLog(@"--------------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
    
}


//死锁 问题(任务不要放到主队列并且同步执行)
- (IBAction)mainQueueSync:(id)sender {
    
    //主队列同步执行
    NSLog(@"任务一");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"任务二");
    });
    NSLog(@"任务三");
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
