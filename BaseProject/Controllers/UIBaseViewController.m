//
//  UIBaseViewController.m
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "UIBaseViewController.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    if (IOS7_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self setNeedsStatusBarAppearanceUpdate];
        
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:K_NavTitleColor,UITextAttributeTextColor,K_NavTitleFont,UITextAttributeFont, nil]];
    }else{
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:K_NavTitleColor,UITextAttributeTextColor,K_NavTitleFont,UITextAttributeFont, nil]];
    }
    
    UIImage *backgroundImage = [[UIImage alloc] imageWithColor:[UIColor orangeColor]];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
}

- (NSString *)getLastViewController {
    NSArray *viewControllers = [self.navigationController viewControllers];
    NSString *vcClass=NSStringFromClass([[viewControllers objectAtIndex:[viewControllers count]-2] class]);
    return vcClass;
}

/*创建一个空页面，调用页面自行释放
 frame:非空
 image：展示图片，可空
 title：显示的空主题，可空
 desc：具体描述，可空
 */
-(UIView*)emptyViewWithFrame:(CGRect)frame image:(NSString *)imageName title:(NSString*)title desc:(NSString*)desc
{
    UIView *view_empty = [[UIView alloc] initWithFrame:frame];
    
    CGFloat startY = 0,spacing = 15,wordLeft = 20;
    CGFloat contentHeight = spacing;
    CGFloat wordWidth = WIDTH_FULL_SCREEN - wordLeft*2;
    if (imageName && ![imageName isEqualToString:@""]) {
        UIImage *_image = [UIImage imageNamed:imageName];
        contentHeight += _image.size.height + spacing*2;
    }
    if (title && ![title isEqualToString:@""]) {
        CGSize size = [title sizeWithFont:K_Font_16 constrainedToSize:CGSizeMake(wordWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
        contentHeight += size.height + spacing;
    }
    if (desc && ![desc isEqualToString:@""]) {
        CGSize size = [desc sizeWithFont:K_Font_14 constrainedToSize:CGSizeMake(wordWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
        contentHeight += size.height + spacing;
    }
    startY = (frame.size.height - contentHeight)/2;
    
    CGFloat offsetY = startY;
    if (imageName && ![imageName isEqualToString:@""]) {
        UIImage *_image = [UIImage imageNamed:imageName];
        UIImageView *iView = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH_FULL_SCREEN - _image.size.width)/2, startY, _image.size.width, _image.size.height)];
        iView.image = _image;
        [view_empty addSubview:iView];
        offsetY += _image.size.height + spacing*2;
    }
    if (title && ![title isEqualToString:@""]) {
        CGSize size = [title sizeWithFont:K_Font_16 constrainedToSize:CGSizeMake(wordWidth, MAXFLOAT)];
        UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(wordLeft, offsetY, wordWidth, size.height)];
        titleLb.textAlignment = NSTextAlignmentCenter;
        titleLb.text = title;
        titleLb.font = K_Font_16;
        titleLb.textColor = [UIColor grayColor];
        titleLb.lineBreakMode = NSLineBreakByCharWrapping;
        titleLb.numberOfLines = 0;
        [view_empty addSubview:titleLb];
        offsetY += size.height + spacing;
    }
    if (desc && ![desc isEqualToString:@""]) {
        CGSize size = [desc sizeWithFont:K_Font_14 constrainedToSize:CGSizeMake(wordWidth, MAXFLOAT)];
        UILabel *descLb = [[UILabel alloc] initWithFrame:CGRectMake(wordLeft, offsetY, wordWidth, size.height)];
        descLb.textAlignment = NSTextAlignmentCenter;
        descLb.text = desc;
        descLb.font = K_Font_14;
        descLb.textColor = [UIColor grayColor];
        descLb.lineBreakMode = NSLineBreakByCharWrapping;
        descLb.numberOfLines = 0;
        [view_empty addSubview:descLb];
    }
    
    return view_empty;
}

#pragma mark - Bar button item

- (void)setLeftBarButtionItemWithImageType:(BarButtonItemImageType)_barButtonItemImageType barButtonItemType:(LeftBarButtonItemType)_barButtonItemType {
    
    NSString* strImgN  = nil;
    NSString* strImgHL = nil;
    leftBarBtnItem = [[UIBarButtonItem alloc] init];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    switch (_barButtonItemImageType) {
//        case BarButtonItemImageTypeLeftArrow: /* 左侧箭头 */ {
//            if (isClientC) {
//                strImgN  = IMG_Nav_LiftBtn_Normal_C;
//                strImgHL = IMG_Nav_LiftBtn_Highlight_C;
//            }
//            else {
//                strImgN  = IMG_Nav_LiftBtn_Normal;
//                strImgHL = IMG_Nav_LiftBtn_Highlight;
//            }
//        }
//            break;
//        case BarButtonItemImageTypeRightArrow: /* 右侧箭头 */ {
//            strImgN  = IMG_Nav_LiftBtn_Normal;
//            strImgHL = IMG_Nav_LiftBtn_Highlight;
//        }
//            break;
//        case BarButtonItemImageTypeRounderct: /* 无箭头 */ {
//            strImgN  = IMG_Nav_RightBtn_Normal;
//            strImgHL = IMG_Nav_RightBtn_Highlight;
//        }
//            break;
//        default:
//            break;
//    }
    
    [btn setFrame:CGRectMake(0.f, 0.f,
                             [UIImage imageNamed:strImgN].size.width,
                             [UIImage imageNamed:strImgN].size.height)];
    // 判断leftBarButtonItem的功能，并设置创建时是否可用等属性
    switch (_barButtonItemType) {
        case LeftBarButtonItemTypePop: {
            [btn addTarget:self action:@selector(btnUpInside_pop:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case LeftBarButtonItemTypeCustom: {
            [leftBarBtnItem setEnabled:NO];
            [btn addTarget:self action:@selector(leftBarBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        default:
            break;
    }
    
    [btn setBackgroundImage:[UIImage imageNamed:strImgN]  forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:strImgHL] forState:UIControlStateHighlighted];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:11.f]];
    
    [leftBarBtnItem setCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftBarBtnItem];
}

- (void)setLeftBarButtonItemWithTitle:(NSString *)_btnTitle {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:_btnTitle forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0.f, 0.f, 50.0f, 25.0f)];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:K_Font_12];
    [btn addTarget:self action:@selector(leftBarBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    leftBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftBarBtnItem];
}

-(void)setLeftBarButtonItemWithImage:(NSString *)imageStr highlight:(NSString *)highlightImageStr
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightImageStr] forState:UIControlStateHighlighted];
    [btn setFrame:CGRectMake(0.f, 0.f,[UIImage imageNamed:imageStr].size.width,[UIImage imageNamed:imageStr].size.height)];
    [btn.titleLabel setFont:K_Font_12];
    [btn addTarget:self action:@selector(leftBarBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    leftBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //解决系统默认占位
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -5;
    [self.navigationItem setLeftBarButtonItems:@[spacer,leftBarBtnItem]];
}

- (void)setRightBarButtionItemWithTitle:(NSString *)_btnTitle {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:_btnTitle forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0.f, 0.f, 50.0f, 25.0f)];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:K_Font_12];
    [btn addTarget:self action:@selector(rightBarBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:rightBarBtnItem];
}

-(void)setRightBarButtionItemWithImage:(NSString *)imageStr highlight:(NSString *)highlightImageStr {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightImageStr] forState:UIControlStateHighlighted];
    [btn setFrame:CGRectMake(0.f, 0.f,[UIImage imageNamed:imageStr].size.width,[UIImage imageNamed:imageStr].size.height)];
    [btn.titleLabel setFont:K_Font_12];
    [btn addTarget:self action:@selector(rightBarBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //解决系统默认占位
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -5;
    [self.navigationItem setRightBarButtonItems:@[spacer,rightBarBtnItem]];
}

- (void)btnUpInside_pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
#ifdef DEBUG
    NSLog(@"看到这条消息，就说明你们有在自己的子类(view controller)里重写（ -(void)btnUpInside_pop:(id)sender; ），去重写吧，bunny");
#endif
}

- (void)rightBarBtnItemClick:(id)sender {
#ifdef DEBUG
    NSLog(@"看到这条消息，就说明你们有在自己的子类(view controller)里重写（ -(void)rightBarBtnItemClick:(id)sender; ），去重写吧，bunny");
#endif
}

- (void)leftBarBtnItemClick:(id)sender {
#ifdef DEBUG
    NSLog(@"看到这条消息，就说明你们有在自己的子类(view controller)里重写（ -(void)leftBarBtnItemClick:(id)sender; ），去重写吧，bunny");
#endif
}

@end
