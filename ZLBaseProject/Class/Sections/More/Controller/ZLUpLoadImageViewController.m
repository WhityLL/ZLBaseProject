//
//  ZLUpLoadImageViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/29.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLUpLoadImageViewController.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <CoreGraphics/CoreGraphics.h>
#import "UITextView+PlaceHolder.h"

#define padding 10
#define textViewHeight 100
#define pictureHW (SCREEN_WIDTH - 5*padding)/4
#define MaxImageCount 9
#define deleImageWH 25 // 删除按钮的宽高
#define imageTag 2000

@interface ZLUpLoadImageViewController ()<UITextViewDelegate,UIActionSheetDelegate>
@property (nonatomic,weak)UITextView *reportStateTextView;

//imagePicker队列
@property (nonatomic,strong)NSMutableArray *imagePickerArray;
@end

@implementation ZLUpLoadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBaseViewBackGroundColor:[UIColor whiteColor]];
    
    [self set_NaviTitle:@"上传照片"];
    
    UITextView *reportStateTextView = [[UITextView alloc]init];
    [self.view addSubview:reportStateTextView];
    reportStateTextView.frame = CGRectMake(padding, padding, SCREEN_WIDTH-2*padding, 100);
    reportStateTextView.text = self.reportStateTextView.text;  //防止用户已经输入了文字状态
    reportStateTextView.returnKeyType = UIReturnKeyDone;
    reportStateTextView.font = [UIFont systemFontOfSize:15];
    self.reportStateTextView = reportStateTextView;
    self.reportStateTextView.delegate = self;
    self.reportStateTextView.backgroundColor = ZLRandomColor;
    
//    [self initHeaderView];
    
}


//大图特别耗内存，不能把大图存在数组里，存类型或者小图
-(void)initHeaderView
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectZero];
    
    UITextView *reportStateTextView = [[UITextView alloc]init];
    [headView addSubview:reportStateTextView];
    reportStateTextView.frame = CGRectMake(padding, padding, SCREEN_WIDTH-2*padding, 50);
    reportStateTextView.text = self.reportStateTextView.text;  //防止用户已经输入了文字状态
    reportStateTextView.returnKeyType = UIReturnKeyDone;
    reportStateTextView.font = [UIFont systemFontOfSize:15];
    self.reportStateTextView = reportStateTextView;
    self.reportStateTextView.delegate = self;
    
    [reportStateTextView addPlaceHolder:@"说说这一刻的想法"];
    
    NSInteger imageCount = [self.imagePickerArray count];
    for (NSInteger i = 0; i < imageCount; i++) {
        UIImageView *pictureImageView = [[UIImageView alloc]initWithFrame:CGRectMake(padding + (i%4)*(pictureHW+padding), CGRectGetMaxY(reportStateTextView.frame) + padding +(i/4)*(pictureHW+padding), pictureHW, pictureHW)];
        //用作放大图片
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageView:)];
        [pictureImageView addGestureRecognizer:tap];
        
        //添加删除按钮
        UIButton *dele = [UIButton buttonWithType:UIButtonTypeCustom];
        dele.frame = CGRectMake(pictureHW - deleImageWH + 5, -10, deleImageWH, deleImageWH);
        [dele setImage:[UIImage imageNamed:@"btn_right_delete_image"] forState:UIControlStateNormal];
        [dele addTarget:self action:@selector(deletePic:) forControlEvents:UIControlEventTouchUpInside];
        [pictureImageView addSubview:dele];
        
        pictureImageView.tag = imageTag + i;
        pictureImageView.userInteractionEnabled = YES;
        pictureImageView.image = [self.imagePickerArray objectAtIndex:i];;
        [headView addSubview:pictureImageView];
    }
    if (imageCount < MaxImageCount) {
        UIButton *addPictureButton = [[UIButton alloc]initWithFrame:CGRectMake(padding + (imageCount%4)*(pictureHW+padding), CGRectGetMaxY(reportStateTextView.frame) + padding +(imageCount/4)*(pictureHW+padding), pictureHW, pictureHW)];
        [addPictureButton setBackgroundImage:[UIImage imageNamed:@"btn_addPicture_BgImage"] forState:UIControlStateNormal];
        [addPictureButton addTarget:self action:@selector(addPicture) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:addPictureButton];

    }
    
    NSInteger headViewHeight = 120 + (10 + pictureHW)*([self.imagePickerArray count]/4 + 1);
    headView.frame = CGRectMake(0, 100, SCREEN_WIDTH, headViewHeight);
    headView.backgroundColor = ZLRandomColor;
    [self.view addSubview:headView];
}


#pragma mark -- 删除照片
// 删除图片
-(void)deletePic:(UIButton *)btn
{
    if ([(UIButton *)btn.superview isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)(UIButton *)btn.superview;
        
        [self.imagePickerArray removeObjectAtIndex:(imageView.tag - imageTag)];
        [imageView removeFromSuperview];
        
        NSLog(@"照片数量%ld",(unsigned long)self.imagePickerArray.count);
    }
    [self initHeaderView];
    
}

#pragma mark - addPicture//添加图片
- (void)addPicture
{
    [self hideKeyBoard];
    UIActionSheet *sheet = [[UIActionSheet alloc]
                            initWithTitle:nil
                            delegate:self
                            cancelButtonTitle:NSLocalizedString(@"cancel", nil)
                            destructiveButtonTitle:NSLocalizedString(@"Camera", nil)
                            otherButtonTitles:NSLocalizedString(@"Album", nil), nil];
    
    [sheet showInView:self.view];
}

#pragma mark - Text View Delegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([@"\n" isEqualToString:text])
    {
        if ([self.reportStateTextView.text length]) {
            [self.reportStateTextView resignFirstResponder];
        }
        else
        {
            return NO;
        }
    }
    return YES;
}


#pragma mark --  隐藏键盘，关闭所有键盘
- (void)hideKeyBoard
{
    for (UIWindow* window in [UIApplication sharedApplication].windows)
    {
        for (UIView* view in window.subviews)
        {
            [self dismissAllKeyBoardInView:view];
        }
    }
}

-(BOOL) dismissAllKeyBoardInView:(UIView *)view
{
    if([view isFirstResponder])
    {
        [view resignFirstResponder];
        return YES;
    }
    for(UIView *subView in view.subviews)
    {
        if([self dismissAllKeyBoardInView:subView])
        {
            return YES;
        }
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)imagePickerArray{
    if (_imagePickerArray == nil) {
        _imagePickerArray = [[NSMutableArray alloc]init];
    }
    return _imagePickerArray;
}

@end
