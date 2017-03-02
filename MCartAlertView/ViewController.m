//
//  ViewController.m
//  MCartAlertView
//
//  Created by VeLink on 17/3/1.
//  Copyright © 2017年 VeLink. All rights reserved.
//

#import "ViewController.h"
#import "MCartAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClick:(id)sender {
    
    MCartAlertView *mac=[[MCartAlertView alloc]initWithFrame:self.view.bounds];
    mac.DataArray=@[@"asda",@"as",@"aead"];
    mac.McBlock=^(NSString *str,NSIndexPath*index){
    
        NSLog(@"%@",str);
    };
    [self.view addSubview:mac];
    [mac alertViewShow];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
