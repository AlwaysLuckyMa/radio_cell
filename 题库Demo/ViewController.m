//
//  ViewController.m
//  题库Demo
//
//  Created by MaTsonga on 2017/4/17.
//  Copyright © 2017年 MaTsonga. All rights reserved.
//

#import "ViewController.h"
#import "TiKuCell.h"

@interface ViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)TiKuCell * tiKuCell;

@property (assign, nonatomic) NSIndexPath * lastSelIndex;//单选，当前选中的行

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self createTableView];
   
    
}

- (void)createTableView
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(
                                                                   0,
                                                                   64,
                                                                   self.view.bounds.size.width,
                                                                   self.view.bounds.size.height - 64)
                                                  style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TiKuCell" bundle:nil] forCellReuseIdentifier:@"mycell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TiKuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone; //取消cell的选中效果
    
    cell.selectLabel.text = [NSString stringWithFormat:@"第%zi列,第%zi行",indexPath.section, indexPath.row];
 
    
    if (_lastSelIndex == indexPath) {
        
        [cell.selectBtn setImage:[UIImage imageNamed:@"caijiyou_h"] forState:UIControlStateNormal];
        
    }else {
        
        [cell.selectBtn setImage:[UIImage imageNamed:@"caijiyou_n"] forState:UIControlStateNormal];
        
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TiKuCell *lastCell = [tableView cellForRowAtIndexPath:_lastSelIndex]; //获取到点击的cell
    lastCell.selectionStyle = UITableViewCellSelectionStyleNone; //取消cell的选中效果
    lastCell.selectBtn.selected = NO;
    [lastCell.selectBtn setImage:[UIImage imageNamed:@"caijiyou_n"] forState:UIControlStateNormal];
        
    _lastSelIndex = indexPath;
        
    TiKuCell *cell = [tableView cellForRowAtIndexPath:indexPath]; //获取到点击的cell
    [cell.selectBtn setImage:[UIImage imageNamed:@"caijiyou_h"] forState:UIControlStateNormal];
    lastCell.selectBtn.selected = YES;
 
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
