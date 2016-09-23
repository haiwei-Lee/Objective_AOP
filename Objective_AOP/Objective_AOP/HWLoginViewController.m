//
//  HWLoginViewController.m
//  Objective_AOP
//
//  Created by Lucy_Lee on 16/9/19.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "HWLoginViewController.h"

#define kMagin 10

@interface HWLoginViewController ()

@end

@implementation HWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Login", nil);
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5.0f;
    button.frame = CGRectMake(kMagin, 20 * kMagin, self.view.frame.size.width - 2 * kMagin, 6 * kMagin);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

- (void)buttonClicked:(UIButton *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
