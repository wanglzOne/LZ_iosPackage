//
//  GCDtimer.m
//  倒计时
//
//  Created by sm on 17/1/4.
//  Copyright © 2017年 sm. All rights reserved.
//

#import "GCDtimer.h"

@implementation GCDtimer

-(void)GCDtimerLb:(UILabel *)label secondsCountDown:(int)secondsCountDown{
    self.GCDtimerLB=label;
    self.secondsCountDowna=secondsCountDown;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if( self.secondsCountDowna<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.GCDtimerLB.text=[NSString stringWithFormat:@"使用GCDLb %d", self.secondsCountDowna];
            });
        }else{
            int seconds =  self.secondsCountDowna % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.GCDtimerLB.text=[NSString stringWithFormat:@"使用GCDLb %@",strTime];
            });
             self.secondsCountDowna--;
        }
    });
    dispatch_resume(_timer);
}


-(void)dispalyLb:(UILabel *)label secondsCountDown:(int)secondsCountDown{
    self.secondsCountDownb=secondsCountDown;
    self.dispalyLB=label;
#pragma NSTimer 倒计时
    myDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLink)];
    [myDisplayLink addToRunLoop:[NSRunLoop currentRunLoop]forMode:NSDefaultRunLoopMode];
    myDisplayLink.frameInterval=60;

}


-(void)timerLb:(UILabel *)label secondsCountDown:(int)secondsCountDown{
    self.secondsCountDownc=secondsCountDown;
    self.timerLB=label;
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod


}
- (void)displayLink{
    //倒计时-1
     self.secondsCountDownb--;
    //如果count值大于10就取消计时器
    if ([self.buttonRepeat isEqualToString:@"防止按钮重复点击"]) {
         self.dispalyLB.text=[NSString stringWithFormat:@"5秒后在点击 %d", self.secondsCountDownb];
    }else{
       self.dispalyLB.text=[NSString stringWithFormat:@"使用dispalylink %d", self.secondsCountDownb];
    }
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if( self.secondsCountDownb==0){
        [myDisplayLink invalidate];
        if ([self.buttonRepeat isEqualToString:@"防止按钮重复点击"]) {
            self.dispalyLB.text=[NSString stringWithFormat:@"现在可以点击"];
        }
        [[NSNotificationCenter defaultCenter]postNotificationName:@"LBPreventRepeatedClicksViewController" object:nil];
    }
}


-(void)timeFireMethod{
    //倒计时-1
    self.self.secondsCountDownc--;
    //修改倒计时标签现实内容
    self.timerLB.text=[NSString stringWithFormat:@"使用NSTimer %d",self.self.secondsCountDownc];
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(self.self.secondsCountDownc==0){
        [countDownTimer invalidate];
    }
}
@end
