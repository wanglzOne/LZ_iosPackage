//
//  CLYBViewController.m
//  iOS封装
//
//  Created by mac on 17/1/10.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "CLYBViewController.h"

@interface CLYBViewController ()
@property (weak, nonatomic) IBOutlet UILabel *oneL;
@property (weak, nonatomic) IBOutlet UILabel *twoL;
@property (weak, nonatomic) IBOutlet UILabel *thereeL;

@property (nonatomic,strong)NSTimer *oneTimer;
@property (nonatomic,strong)NSTimer *twoTimer;
@property (nonatomic,strong)NSTimer *thereeTimer;
@property (weak, nonatomic) IBOutlet UIImageView *markimg;
@property (nonatomic,strong)dispatch_semaphore_t signal;


@property (nonatomic,assign)bool enabled;

@property (nonatomic,strong)NSString *oneStr;
@property (nonatomic,strong)NSString *twoStr;
@property (nonatomic,strong)NSString *thereeStr;


@property (nonatomic,assign)NSInteger click; //1:点击了第一个按钮 2:点击了第二个按钮


@end

@implementation CLYBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"处理异步线程并发，比如：有ABC三个网络请求，B需要在A网络请求完之后获取到B需要传递的参数才能进行B网络请求，而C呢又需要等到B网络请求完之后获取到C需要传递的参数才能进行C网络请求";
    // Do any additional setup after loading the view from its nib.
    _enabled = YES;
    _oneStr = @"0";
    _twoStr = @"0";
    _thereeStr = @"0";
    
    
    
}


/**
 在GCD中有三个函数是semaphore的操作，分别是：
 　　dispatch_semaphore_create　　　创建一个semaphore
 　　dispatch_semaphore_signal　　　发送一个信号
 　　dispatch_semaphore_wait　　　　等待信号
 */

-(void)xinHaoLiang{
    _signal = dispatch_semaphore_create(2);//创建一个为1信号量的信号
    __block long x = 0;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        sleep(1);
//        x = dispatch_semaphore_signal(signal);//此时信号量为0 对signal增加1 信号量变为1，
//        sleep(2);//睡两秒
//        x = dispatch_semaphore_signal(signal);
//    });
    
    x = dispatch_semaphore_wait(_signal, DISPATCH_TIME_FOREVER);//此时信号量为1 所以执行下边，切对signal减掉1.然后信号量为0
    NSLog(@"3_x:%ld",x);
    [self startOneTimer];
    
    x = dispatch_semaphore_wait(_signal, DISPATCH_TIME_FOREVER);///此时信号量为0，永远等待，在等待的时候执行block了，在等待block时候block内对信号量增加了1，然后开始执行下边，并且信号量再次减掉1 变为0
    [self stopTwoTimer];
    x = dispatch_semaphore_wait(_signal, DISPATCH_TIME_FOREVER);//此时信号量为0，永远等待，在等待的时候执行block了，在等待block时候block内对信号量增加了1，然后开始执行下边，并且信号量再次减掉1 变为0
    [self startThereeTimer];
    
    NSLog(@"wait 3");
    NSLog(@"5_x:%ld",x);
}

-(void)startOneTimer{
    if (!_oneTimer) {
        _oneTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clickOneTimer) userInfo:nil repeats:YES];
    }
}
-(void)startTwoTimer{
    if (!_twoTimer) {
        _twoTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clickTwoTimer) userInfo:nil repeats:YES];
    }
}
-(void)startThereeTimer{
    if (!_thereeTimer) {
        _thereeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clickThereeTimer) userInfo:nil repeats:YES];
    }
}

-(void)stopOneTimer{
    [_oneTimer invalidate];
    _oneTimer = nil;
}
-(void)stopTwoTimer{
    [_twoTimer invalidate];
    _twoTimer = nil;
}
-(void)stopThereeTimer{
    [_thereeTimer invalidate];
    _thereeTimer = nil;
}

-(void)clickOneTimer{
    if (_click == 1) {
        _oneStr = [NSString stringWithFormat:@"%zd",[_oneStr integerValue] + 1];
        _oneL.text = _oneStr;
        if ([_oneL.text integerValue] > 9) {
            [self stopOneTimer];
            _oneStr = @"0";
        }
    }else{
        _oneStr = [NSString stringWithFormat:@"%zd",[_oneStr integerValue] + 1];
        _oneL.text = _oneStr;
        _twoL.text = @"0";
        _thereeL.text = @"0";
        _markimg.hidden = YES;
        if ([_oneL.text integerValue] > 9) {
            [self stopOneTimer];
            //dispatch_semaphore_signal(_signal);
            [self startTwoTimer];
        }
    }
   
    
    
    
}

-(void)clickTwoTimer{
    if (_click == 1) {
        _twoStr = [NSString stringWithFormat:@"%zd",[_twoStr integerValue] + 1];
        _twoL.text = _twoStr;
        if ([_twoL.text integerValue] > 9) {
            [self stopTwoTimer];
            _twoStr = @"0";
            
        }
    }else{
        _twoStr = [NSString stringWithFormat:@"%zd",[_twoStr integerValue] + 1];
        _twoL.text = _twoStr;
        if ([_twoL.text integerValue] > 9) {
            [self stopTwoTimer];
            _twoStr = @"0";
            [self startThereeTimer];
            //dispatch_semaphore_signal(_signal);
            //dispatch_semaphore_signal(_signal);
        }
    }
   
}

-(void)clickThereeTimer{
    _enabled = YES;
    if (_click == 1) {
        _thereeStr = [NSString stringWithFormat:@"%zd",[_thereeStr integerValue] + 1];
        _thereeL.text = _thereeStr;
        if ([_thereeL.text integerValue] > 9) {
            [self stopThereeTimer];
            _thereeStr = @"0";
            _markimg.hidden = NO;
        }else{
            _markimg.hidden = YES;
        }
    }else{
        _thereeStr = [NSString stringWithFormat:@"%zd",[_thereeStr integerValue] + 1];
        _thereeL.text = _thereeStr;
        if ([_thereeL.text integerValue] > 9) {
            [self stopThereeTimer];
            _thereeStr = @"0";
            _oneStr = @"0";
            _twoStr = @"0";
            _markimg.hidden = NO;
        }else{
            _markimg.hidden = YES;
        }
    }
}

- (IBAction)weiChuli:(UIButton *)sender {
    if (!_enabled) {
        return;
    }
    _enabled = NO;
    _click = 1;
    [self startOneTimer];
    [self startTwoTimer];
    [self startThereeTimer];
    
}
- (IBAction)chuLI:(UIButton *)sender {
    if (!_enabled) {
        return;
    }
    _enabled = NO;
    _click = 2;
    [self startOneTimer];
    //[self xinHaoLiang];
    
}


-(void)viewDidDisappear:(BOOL)animated{
    [self stopOneTimer];
    [self stopThereeTimer];
    [self stopTwoTimer];
}


@end
