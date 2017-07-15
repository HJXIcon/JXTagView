//
//  JXTagView.h
//  JXShopDemo
//
//  Created by mac on 17/4/20.
//  Copyright © 2017年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXTagFrame.h"

@interface JXTagView : UIView
@property (nonatomic, strong) JXTagFrame *tagsFrame;
/** 选中tag回调*/
@property (nonatomic, copy)void(^selectIndexBlock)(NSInteger index);
/** 删除回调*/
@property (nonatomic, copy)void(^deleteIndexBlock)(NSInteger index);


////// ----------- color ------------ //////
/** 背景颜色*/
@property (nonatomic, strong)UIColor *normalBgColor;
/** 选中背景颜色*/
@property (nonatomic, strong)UIColor *selectBgColor;
/** 选中颜色*/
@property (nonatomic, strong)UIColor *selectColor;
/** 字体颜色*/
@property (nonatomic, strong)UIColor *normalColor;
// 边框颜色  Default：lightGrayColor
@property(nonatomic, strong) UIColor *border_color;

////// ----------- font ------------ //////
/** 字体*/
@property (nonatomic, assign)UIFont *font;

/** 删除按钮*/
@property (nonatomic, assign)BOOL showDelete;

- (void)updateTags;

@end
