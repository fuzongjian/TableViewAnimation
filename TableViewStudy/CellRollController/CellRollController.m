//
//  CellRollController.m
//  TableViewStudy
//
//  Created by 付宗建 on 16/8/14.
//  Copyright © 2016年 youran. All rights reserved.
//

#import "CellRollController.h"
#import "CustomRollCell.h"
#define kAngle (90.0 * M_PI) / 180.0
@interface CellRollController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
/**
 *  @brief 设置cell角度
 */
@property (nonatomic,assign) CGFloat  angle;
/**
 *  @brief 设置cell的锚点
 */
@property (nonatomic,assign) CGPoint  anchorPoint;
@property (nonatomic,assign) CGFloat  lastOffset_Y;
@end

@implementation CellRollController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomRollCell * cell = [CustomRollCell tableView:tableView cellAnchorPoint:_anchorPoint cellAngle:_angle];
    cell.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",indexPath.row + 1]];

    return cell;
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 240;
//}
#pragma mark --- 下面的效果可以单独拿出来用
#if 0
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, 0, 0, 0, 1);//渐变
    transform = CATransform3DTranslate(transform, -200, 0, 0);//左边水平移动
    //        transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
    
    cell.layer.transform = transform;
    cell.layer.opacity = 0.0;
    
    [UIView animateWithDuration:0.6 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.layer.opacity = 1;
    }];

}
#endif
/**
 *  @brief 滚动监听
 *
 *  @param scrollView tableView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView != self.tableView) return;
    
    CGFloat offset_Y = scrollView.contentOffset.y;
    
    if (offset_Y > _lastOffset_Y) {//向上拖动
        // x=0 y=0 左
        // x=1，y=0 -angle 右
        _angle = - kAngle;
        _anchorPoint = CGPointMake(1, 0);
    }else{//向下拖动
        // x=0 y=1 -angle 左
        // x=1 y=1 右
        _angle = - kAngle;
        _anchorPoint = CGPointMake(0, 1);
    }
    _lastOffset_Y = offset_Y;
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 240;
        _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bak.jpg"]];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
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
