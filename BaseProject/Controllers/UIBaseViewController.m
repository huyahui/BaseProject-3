//
//  UIBaseViewController.m
//  UTeam
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "UIBaseViewController.h"
#import "LeveyTabBarController.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController
- (void)dealloc
{
    [_http cancelAll];
    [[SDImageCache sharedImageCache] clearMemory];
    DLog(@"dealloc [%@]",NSStringFromClass([self class]));
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _isPush = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUND_COLOR;
    [self httpInit];
    
    if (IOS7_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self setNeedsStatusBarAppearanceUpdate];
        
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:Navigation_Title_Color,UITextAttributeTextColor,Navigation_Font,UITextAttributeFont, nil]];
    }else{
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:Navigation_Title_Color,UITextAttributeTextColor,Navigation_Font,UITextAttributeFont, nil]];
    }
    UIColor *navBgColor = NavigationBg_Color;
    UIImage *backgroundImage = [[UIImage alloc] imageWithColor:navBgColor];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    if(self.navigationController &&
       self.navigationController.hidesBottomBarWhenPushed == NO &&
       self.navigationController.viewControllers.count > 1)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,14.f,25.f)];
        [button setBackgroundImage:ImageNamed(@"back") forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        button.showsTouchWhenHighlighted = YES;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    }
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

#pragma mark - Left Bar button item
- (void)setLeftBarButtonItemWithTitle:(NSString *)_btnTitle target:(SEL)target {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:_btnTitle forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0.f, 0.f, 50.0f, 25.0f)];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:K_Font_12];
    [btn addTarget:self action:target forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftBarBtnItem];
}

-(void)setLeftBarButtonItemWithImage:(NSString *)imageStr highlight:(NSString *)highlightImageStr target:(SEL)target
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightImageStr] forState:UIControlStateHighlighted];
    [btn setFrame:CGRectMake(0.f, 0.f,[UIImage imageNamed:imageStr].size.width,[UIImage imageNamed:imageStr].size.height)];
    [btn.titleLabel setFont:K_Font_12];
    [btn addTarget:self action:target forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //解决系统默认占位
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -5;
    [self.navigationItem setLeftBarButtonItems:@[spacer,leftBarBtnItem]];
}

#pragma mark - Right Bar button item
- (void)setRightBarButtionItemWithTitle:(NSString *)_btnTitle target:(SEL)target
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:_btnTitle forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0.f, 0.f, 50.0f, 25.0f)];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:K_Font_12];
    btn.showsTouchWhenHighlighted = YES;
    [btn addTarget:self action:target forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:rightBarBtnItem];
}

-(void)setRightBarButtionItemWithImage:(NSString *)imageStr highlight:(NSString *)highlightImageStr target:(SEL)target
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightImageStr] forState:UIControlStateHighlighted];
    [btn setFrame:CGRectMake(0.f, 0.f,[UIImage imageNamed:imageStr].size.width,[UIImage imageNamed:imageStr].size.height)];
    [btn.titleLabel setFont:K_Font_12];
    btn.showsTouchWhenHighlighted = YES;
    [btn addTarget:self action:target forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
}

#pragma mark - Custom Methods

-(void) willBack {
    _alarmMessage = nil;
}

-(void) backAction:(id)sender{
    [_http cancelAll];
    [self willBack];
    if(_isPush){
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (NSString *)getLastViewController {
    NSArray *viewControllers = [self.navigationController viewControllers];
    NSString *vcClass=NSStringFromClass([[viewControllers objectAtIndex:[viewControllers count]-2] class]);
    return vcClass;
}

-(void) httpInit
{
    _http = [[MAppHttp alloc] init];
}

-(MAppHttp *) getHttpObject{
    return _http;
}

#pragma mark - UIInterfaceOrientation
- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - Loading Image
-(void) hudShow:(UIView *)inView msg:(NSString *)msgText
{
    if(!_mbProgressHud){
        _mbProgressHud = [[MBProgressHUD alloc] initWithView:inView];
        _mbProgressHud.mode = MBProgressHUDModeIndeterminate;//;
        if(msgText && msgText.length > 0){
            [_mbProgressHud setLabelText:msgText];
        }
        [inView addSubview:_mbProgressHud];
    }
    [_mbProgressHud show:YES];
}

-(void) hudClose
{
    if(_mbProgressHud){
        [_mbProgressHud hide:NO];
        _mbProgressHud = nil;
    }
}

@end
