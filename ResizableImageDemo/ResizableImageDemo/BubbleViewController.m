//
//  BubbleViewController.m
//  ResizableImageDemo
//
//  Created by Xu Chen on 2018/8/25.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "BubbleViewController.h"
#import "UIImage+ChXResizable.h"

@interface BubbleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bubleImgView;

@end

@implementation BubbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"圆角背景图片拉伸";
    
    [self changeImage];
    
//    [self cornerImage];
    
}

- (void)cornerImage {
    self.bubleImgView.backgroundColor = UIColor.redColor;
    self.bubleImgView.layer.cornerRadius = 8;
    self.bubleImgView.layer.masksToBounds = YES;
}

- (void)changeImage {
    UIImage *image = [UIImage imageNamed:@"bg-system-notice"];
    

    // MARK: - 方法一
    /*
     定义指定区域被拉伸，从 上、左、下、右 分别在图片上画一个矩形框，范围内的区域被拉伸，外部保持不变
     
     UIEdgeInsetsMake(30,30, 30,30): 上左下右边距30，不会被拉升，其余部分（被边距划出来的矩形区域）会被拉伸
    
     UIImageResizingModeStretch: 通过拉伸 UIEdgeInsets 指定的的矩形区域来填充图片
     UIImageResizingModeTile: 通过重复显示 UIEdgeInsets 指定的矩形区域来填充图片
     
     */
    
//    coreRadius：圆角半径
//    横向拉伸：UIEdgeInsetsMake(0, coreRadius, 0, coreRadius)，例如圆角/横向胶囊按钮贴图。
//    纵向拉伸：UIEdgeInsetsMake(coreRadius, 0, coreRadius, 0)，例如类似温度计的圆角/纵向胶囊按钮贴图。
//    居中拉伸：UIEdgeInsetsMake(coreRadius, coreRadius,coreRadius, coreRadius)，例如带corner的圆角登录按钮。
//    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0,10,0,10) resizingMode:UIImageResizingModeStretch];
    
    image = [UIImage chx_resizableImage:image];
//    image = [UIImage chx_resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) image:image];
    
    // MARK: - 方法二
    /*
     创建图片内容可拉伸，而边角不拉伸
     
     leftCapWidth：左边不拉伸区域的宽度
     topCapHeight：上面不拉伸区域的高度
     扩展：
     rightCapWidth = 图片宽度 - leftCapWidth - 1
     bottomCapHeight = 图片高度 - topCapHeight - 1
     而拉伸区域 capInset 实际上是（topCapHeight,leftCapWidth,bottomCapHeight,rightCapWidth）
     所以，一般 leftCapWidth 取 图片宽度 的一半，topCapHeight 取 图片高度 的一半，来获取拉伸区域 1*1 的矩阵来 复制填充（UIImageResizingModeTile），保持外围的区域不变
     */
//    NSUInteger leftCapWidth = image.size.width*0.5;
//    NSUInteger topCapHeight = 0;
//    image = [image stretchableImageWithLeftCapWidth:leftCapWidth
//                                       topCapHeight:topCapHeight];

    
    [self.bubleImgView setImage:image];


}



@end
