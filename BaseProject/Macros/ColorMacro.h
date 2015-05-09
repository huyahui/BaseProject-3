//
//  ColorMacro.h
//  UTeam
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#ifndef UTeam_ColorMacro_h
#define UTeam_ColorMacro_h

//----------------------基础颜色方法---------------------------

//RGB
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

//RGBA
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//HEX
#define HEXCOLOR(c)         ([UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f]);

//----------------------基础颜色方法---------------------------


//----------------------项目颜色定义--------------------------------

//页面背景色
#define BACKGROUND_COLOR HEXCOLOR(0xeeeeee)

//主蓝色导航框及大色块蓝色
#define NavigationBg_Color HEXCOLOR(0x0099cc)

//Tabbar颜色
#define TabbarBg_Color HEXCOLOR(0xfefefe)

//导航栏标题颜色
#define Navigation_Title_Color [UIColor whiteColor]

//导航栏左右按钮文字颜色
#define Navigation_Button_Title_Color [UIColor whiteColor]

//分割线
#define CellLine_Color HEXCOLOR(0xc2c2c2)

//个人姓名-男
#define Name_Male_Color HEXCOLOR(0x026c91)

//个人姓名-女
#define Name_Female_Color HEXCOLOR(0xea3e8a)

//评论转发点赞的淡蓝色底框
#define Share_Bg_Color HEXCOLOR(0xeef7fe)

//灰色字体
#define Gray_Text_Color HEXCOLOR(0xc2c2c2)

//蓝色字体
#define Blue_Text_Color HEXCOLOR(0x026c91)

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

#endif
