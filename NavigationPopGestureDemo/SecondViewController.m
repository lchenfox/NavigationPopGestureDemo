//
//  SecondViewController.m
//  NavigationPopGestureDemo
//
//  Created by CQJ on 2021/3/10.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    NSTimer *_timer;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Wait 100s to execute `timeAction`
    _timer = [NSTimer scheduledTimerWithTimeInterval:100 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popGestureDidEnd) name:@"SecondViewController" object:nil];
}

- (void)popGestureDidEnd
{
    NSLog(@"⚠️⚠️⚠️ OOPS！SecondViewController -> popGestureDidEnd");
    [self removeTimer];
}

- (void)timeAction
{
    NSLog(@"Timer is called!");
}

- (void)removeTimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)dealloc
{
    NSLog(@"⚠️⚠️⚠️ OOPS！dealloc SecondViewController!");
    [self removeTimer];
}

@end
