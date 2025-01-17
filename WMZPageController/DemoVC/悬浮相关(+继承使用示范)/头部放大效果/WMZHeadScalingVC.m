//
//  WMZHeadScalingVC.m
//  WMZPageController
//
//  Created by wmz on 2021/8/9.
//  Copyright © 2021 wmz. All rights reserved.
//

#import "WMZHeadScalingVC.h"
#import "UIImageView+WebCache.h"
#import "TopSuspensionVC.h"
@interface WMZHeadScalingVC ()

@end

@implementation WMZHeadScalingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:10/255.0 green:10/255.0 blue:20/255.0 alpha:0]}];
    NSArray *data = @[@"热门",@"男装",@"美妆",@"手机",@"食品",@"电器",@"鞋包",@"百货",@"女装",@"汽车",@"电脑"];
    WMZPageParam *param = WMZPageParam.new;
    param.wTitleArr = data;
    param.wViewController = ^UIViewController * _Nullable(NSInteger index) {
        TopSuspensionVC *vc = [TopSuspensionVC new];
        vc.page = index;
        return vc;
    };
    ///头部缩放
    param.wHeadScaling = YES;
    param.wTopSuspension = YES;
    param.wBounces = YES;
    param.wFromNavi = NO;
    param.wNaviAlpha = YES;
    ///头部
    param.wMenuHeadView = ^UIView * _Nullable{
        UIImageView *image = [UIImageView new];
        [image sd_setImageWithURL:[NSURL URLWithString:@"https://upload-images.jianshu.io/upload_images/9163368-02e26751674a3bc6.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"]];
        image.frame = CGRectMake(0, 0, PageVCWidth, 300);
        /// 必须返回一个UIImageView
        /// 若有其他子视图 则在image上添加
        return image;
    };
    self.param = param;
}

@end
