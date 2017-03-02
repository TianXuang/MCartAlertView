//
//  MCartAlertView.m
//  MCartAlertView
//
//  Created by VeLink on 17/3/1.
//  Copyright © 2017年 VeLink. All rights reserved.
//

#import "MCartAlertView.h"
#import <UIKit/UIKit.h>
//Cell
@interface MCartAlertTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *MCLable;
@property(nonatomic,strong)UIButton *imageBut;
@end
@implementation MCartAlertTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatUI];
    }
    return self;
}
-(void)creatUI
{
    UIView *lineV=[[UIView alloc]init];
//    lineV.backgroundColor=[];
    [self.contentView addSubview:lineV];
    _MCLable=[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 200, 40)];
    [self.contentView addSubview:_MCLable];
    _imageBut=[UIButton buttonWithType:UIButtonTypeCustom];
    _imageBut.frame=CGRectMake(200, 5, 30, 30);
    [_imageBut setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_imageBut setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self.contentView addSubview:_imageBut];
    
}
@end
//视图
@implementation MCartAlertView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self creatTable];
    }
    return self;
}
-(void)creatTable
{
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.65) style:UITableViewStyleGrouped];
    _table.backgroundColor=[UIColor whiteColor];
    _table.delegate=self;
    _table.dataSource=self;
    _table.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self addSubview:_table];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _DataArray.count?_DataArray.count:0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identAlert=@"MCalert";
      MCartAlertTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:identAlert];
    if (cell==nil)
    {
        cell=[[MCartAlertTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identAlert];
    }
    cell.MCLable.text=_DataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.McBlock)
    {
        _McBlock(_DataArray[indexPath.row],indexPath);
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *HeaderView=[[UIView alloc]init];
    UILabel *titleV=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    titleV.text=@"lalal";
    titleV.textAlignment=NSTextAlignmentCenter;
    titleV.font=[UIFont systemFontOfSize:15.0];
//    titleV.textColor=[UIColor colo];
    [HeaderView addSubview:titleV];
    return HeaderView;
}
-(void)setDataArray:(NSArray *)DataArray
{
    _DataArray=DataArray;
    [_table reloadData];
    
}
-(void)alertViewShow
{
    [UIView animateWithDuration:0.25 animations:^{
        _table.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height*0.35, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.65);
    }];
}
-(void)alertViewHidden
{
    [UIView animateWithDuration:0.25 animations:^{
        _table.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.65);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        _table=nil;
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self alertViewHidden];
}
@end
