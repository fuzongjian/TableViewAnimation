//
//  SuperViewController.m
//  TableViewStudy
//
//  Created by 付宗建 on 16/8/14.
//  Copyright © 2016年 youran. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 0, 45, 40);
    backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    // Do any additional setup after loading the view.
}
- (void)backButtonClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
