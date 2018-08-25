//
//  ShadowViewController.m
//  ResizableImageDemo
//
//  Created by Xu Chen on 2018/8/25.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "ShadowViewController.h"
#import "UIImage+ChXResizable.h"

@interface ShadowViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *shadowImage;

@end

@implementation ShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"用于mask遮罩效果的图片配合resizableImage使用";
    
    [self resizableImage];
}

- (void)resizableImage {
    self.shadowImage.image = [UIImage chx_resizableImage:self.shadowImage.image];
    
    
    // MARK: - 圆角阴影背景
    
    // 作为mask用的图片
    UIImage *maskImage = [UIImage imageNamed:@"阴影图片"];
    maskImage = [UIImage chx_resizableImage:maskImage];
    // 作为mask用的view
    UIImageView *maskView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 250)];
//    maskView.backgroundColor = UIColor.blackColor;
//    maskView.alpha = 0.7;
    maskView.image = maskImage;
    
    // 背景图
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"bg.jpeg"];
    bgView.backgroundColor = UIColor.lightGrayColor;
    bgView.frame = CGRectMake(0, 0,200, 250);
    bgView.center = self.view.center;
    
    // maskView 是将自己 投影 到了 父视图 上
    // 1.设置了遮罩属性后view只显示和遮罩重叠的区域。
    // 2.通过改变遮罩的alpha和颜色实现透明、半透明的效果。
    // 3.可以放一个渐变的图片，在视图的遮罩视图上，那么视图就是渐变的了
    bgView.maskView  = maskView;
    

    [self.view addSubview:bgView];
    
}


@end
