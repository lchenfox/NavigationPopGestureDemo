//
//  FirstViewController.m
//  NavigationPopGestureDemo
//
//  Created by CQJ on 2021/3/10.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popGestureDidEnd) name:@"FirstViewController" object:nil];
}

- (void)popGestureDidEnd
{
    NSLog(@"⚠️⚠️⚠️ OOPS！FirstViewController -> popGestureDidEnd");
}

- (IBAction)pushToSecond:(UIButton *)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)dealloc
{
    NSLog(@"⚠️⚠️⚠️ OOPS！dealloc FirstViewController!");
}

@end
