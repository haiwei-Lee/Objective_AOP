//
//  HWViewController.m
//  Objective_AOP
//
//  Created by Lucy_Lee on 16/9/19.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "HWViewController.h"
#import "HWLoginViewController.h"
#import "HWPersonViewController.h"

#define kMagin 10

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Objective_AOP", nil);
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5.0f;
    button.frame = CGRectMake(kMagin, 10 * kMagin, self.view.frame.size.width - 2 * kMagin, 6 * kMagin);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"tap" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [self.view addSubview:button];
    
}

- (void)buttonClicked:(UIButton *)sender{

    [self.navigationController pushViewController:[[HWPersonViewController alloc]init] animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
