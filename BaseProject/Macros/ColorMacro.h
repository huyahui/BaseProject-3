//
//  ColorMacro.h
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#ifndef BaseProject_ColorMacro_h
#define BaseProject_ColorMacro_h

//----------------------基础颜色方法---------------------------
//RGB
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
//RGBA
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//HEX
#define HEXCOLOR(c)         [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f];
//----------------------基础颜色方法---------------------------


//----------------------项目颜色定义--------------------------------
//背景色
#define BACKGROUND_COLOR    [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]
//清除背景色
#define CLEARCOLOR [UIColor clearColor]

//导航栏标题颜色
#define K_NavTitleColor [UIColor darkGrayColor]

//分割线
#define K_CellLineColor [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1]

#endif
