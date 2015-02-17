//
//  UIBaseViewController.h
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    BarButtonItemTypeLeftArrow = 0, //左邊有箭頭
    BarButtonItemTypeRightArrow,    //右边有箭头
    BarButtonItemTypeRoundrect      //无箭头
}BarButtonItemType;

typedef enum {
    BarButtonItemImageTypeLeftArrow = 0, // 左边有箭头
    BarButtonItemImageTypeRightArrow,    // 右边有箭头
    BarButtonItemImageTypeRounderct      // 无箭头
}BarButtonItemImageType;

typedef enum {
    LeftBarButtonItemTypePop = 0,
    LeftBarButtonItemTypeCustom
}LeftBarButtonItemType;

//所有新建Controller类的基类
@interface UIBaseViewController : UIViewController {
    UIBarButtonItem * rightBarBtnItem;
    UIBarButtonItem * leftBarBtnItem;
}

- (NSString *)getLastViewController;

/*创建一个空页面，调用页面自行释放
 frame:非空
 image：展示图片，可空
 title：显示的空主题，可空
 desc：具体描述，可空
 */
-(UIView*)emptyViewWithFrame:(CGRect)frame image:(NSString *)imageName title:(NSString*)title desc:(NSString*)desc;

//导航栏左右按钮的设置
- (void)setLeftBarButtionItemWithImageType:(BarButtonItemImageType)_barButtonItemImageType barButtonItemType:(LeftBarButtonItemType)_barButtonItemType;
- (void)setLeftBarButtonItemWithTitle:(NSString *)_btnTitle;
- (void)setLeftBarButtonItemWithImage:(NSString *)imageStr highlight:(NSString *)highlightImageStr;
- (void)setRightBarButtionItemWithTitle:(NSString *)_btnTitle;
- (void)setRightBarButtionItemWithImage:(NSString *)imageStr highlight:(NSString *)highlightImageStr;

//左右按钮的响应事件
- (void)btnUpInside_pop:(id)sender;
- (void)rightBarBtnItemClick:(id)sender;
- (void)leftBarBtnItemClick:(id)sender;

@end
