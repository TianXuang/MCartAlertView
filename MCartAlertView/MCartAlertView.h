//
//  MCartAlertView.h
//  MCartAlertView
//
//  Created by VeLink on 17/3/1.
//  Copyright © 2017年 VeLink. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCartAlertView;
typedef void(^MCartResult)(NSString *,NSIndexPath*);
@interface MCartAlertView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *DataArray;
@property(nonatomic,strong)MCartResult McBlock;
////block回调
//-(void)sentBlockToView:(MCartResult)block;

/**
  展现
 */
-(void)alertViewShow;
/**
 隐藏
 */
-(void)alertViewHidden;
@end
