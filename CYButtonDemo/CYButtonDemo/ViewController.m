//
//  ViewController.m
//  CYButtonDemo
//
//  Created by cheny on 15/8/27.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//

#import "ViewController.h"
#import "CYButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CYButton *btn = [[CYButton alloc] init];
    btn.imageTitleType = CYButtonImageTitleTypeTopBottom;
    [btn setTitle:@"基金超市" forState:UIControlStateNormal];
    UIImage *image = [UIImage imageNamed:@"icon_fund"];
    [btn setImage:image forState:UIControlStateNormal];
    btn.titleFont = [UIFont systemFontOfSize:14];
    CGFloat titleW;
    NSDictionary *attrs = @{NSFontAttributeName : btn.titleFont};
    titleW = [@"基金超市" boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;

    btn.frame = CGRectMake(100, 100, MAX(titleW, image.size.width), 65);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
}

@end
