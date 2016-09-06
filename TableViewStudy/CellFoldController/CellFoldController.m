//
//  CellFoldController.m
//  TableViewStudy
//
//  Created by 付宗建 on 16/9/6.
//  Copyright © 2016年 youran. All rights reserved.
//

#import "CellFoldController.h"
#import "FoldCell.h"
#import "CellFrame.h"
#import "CellModel.h"
@interface CellFoldController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataArray;

@end

@implementation CellFoldController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
#pragma mark --- TableView Delegate Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellID";
    FoldCell * flodCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (flodCell == nil) {
        flodCell = [[FoldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    CellFrame * frame = self.dataArray[indexPath.row];
    flodCell.cellFrame = frame;
    return flodCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CellFrame * cellFrame = self.dataArray[indexPath.row];
    CellModel * cellModel = cellFrame.cellModel;
    if (cellFrame.isOpened) {
        cellFrame.opened = NO;
    }else{
        cellFrame.opened = YES;
    }
    //每次点击需要重新设置frame，并刷新表格数据
    [cellFrame setCellModel:cellModel];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellFrame * frame = self.dataArray[indexPath.row];
    return frame.cellHeight;
}
#pragma mark --- 滑动cell时的操作
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //删除按钮
    UITableViewRowAction * deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView reloadData];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    //已读按钮
    UITableViewRowAction * readedAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"已读" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%@",@"已读");
    }];
    readedAction.backgroundColor = [UIColor colorWithRed:255/255.0 green:194/255.0 blue:68/255.0 alpha:1.0];
    
    //置顶按钮
    UITableViewRowAction * stickAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        CellFrame * frame = [[CellFrame alloc] init];
        frame = self.dataArray[indexPath.row];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.dataArray insertObject:frame atIndex:0];
        [self.tableView reloadData];
    }];
    stickAction.backgroundColor = [UIColor lightGrayColor];
    
    return @[deleteAction,readedAction,stickAction];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.layer.transform = CATransform3DMakeScale(0.6, 0.6, 1);
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
#pragma mark --- lazy load
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor magentaColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [CellFrame cellSourceWithName:@"MessageSource"];
    }
    return _dataArray;
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
