//
//  UIImage+ChXResizable.h
//  ResizableImageDemo
//
//  Created by Xu Chen on 2018/8/25.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//  拉伸图片 - 解决气泡边角拉伸会变形问题

#import <UIKit/UIKit.h>

@interface UIImage (ChXResizable)
/**
 中心点 拉伸图片
 只拉伸中间 1*1 的矩形区域，两边不会被拉伸
 */
+ (UIImage *)chx_resizableImage:(UIImage *)image;

/**
 指定矩形框范围 拉伸图片
 
 @param capInsets 拉伸区域：
 例：居中拉伸 - UIEdgeInsetsMake(coreRadius, coreRadius,coreRadius, coreRadius) -  coreRadius（圆角半径）
 */
+ (UIImage *)chx_resizableImageWithCapInsets:(UIEdgeInsets)capInsets
                                       image:(UIImage *)image;


@end
