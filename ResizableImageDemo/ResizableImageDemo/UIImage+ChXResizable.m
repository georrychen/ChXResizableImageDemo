//
//  UIImage+ChXResizable.m
//  ResizableImageDemo
//
//  Created by Xu Chen on 2018/8/25.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "UIImage+ChXResizable.h"

@implementation UIImage (ChXResizable)
// 拉伸图片，可解决气泡背景图，圆角按钮背景图，修改尺寸边角被拉伸变形的问题
+ (UIImage *)chx_resizableImage:(UIImage *)image {
    NSInteger leftCatpWidth = image.size.width * 0.5;
    NSInteger topCapHeight = image.size.height * 0.5;
    return [image stretchableImageWithLeftCapWidth:leftCatpWidth topCapHeight:topCapHeight];
}

// 指定 上、左、下、右 的区域拉伸图片，范围外不拉伸
+ (UIImage *)chx_resizableImageWithCapInsets:(UIEdgeInsets)capInsets
                                       image:(UIImage *)image {
    return  [image resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
}

@end
