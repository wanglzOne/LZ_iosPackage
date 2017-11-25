//
//  HUPhotoBrowserCell.m
//  HUPhotoBrowser
//
//  Created by mac on 16/2/24.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUPhotoBrowserCell.h"
#import "const.h"
#import "HUWebImageDownloader.h"


@interface HUPhotoBrowserCell () <UIScrollViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation HUPhotoBrowserCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.maximumZoomScale = 4;
    _scrollView.minimumZoomScale = 1;
    _scrollView.delegate = self;

    [self addSubview:_scrollView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:imageView];
    [_scrollView addSubview:imageView];
    _imageView = imageView;
    
    
    self.imageView.userInteractionEnabled=YES;
    UILongPressGestureRecognizer *longgesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longgestureimage:)];
    [self.imageView addGestureRecognizer:longgesture];
    
}
//长按手势
-(void)longgestureimage:(UILongPressGestureRecognizer*)gesture{
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        return;
    } else if (gesture.state == UIGestureRecognizerStateBegan) {
        UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"" message:@"确定要保存该图片吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [view show];
    }
    
}
#pragma mark ----UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    }
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    if (error == nil) {
        
        
    }else{
        
        
    }
}

- (void)resetZoomingScale {
    
    if (self.scrollView.zoomScale !=1) {
         self.scrollView.zoomScale = 1;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _scrollView.frame = self.bounds;
    _imageView.frame = _scrollView.bounds;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    [[NSNotificationCenter defaultCenter] postNotificationName:kPhotoCellDidZommingNotification object:_indexPath];
}

- (void)configureCellWithURLStrings:(NSString *)URLStrings {
    self.imageView.image = self.placeholderImage;
    NSURL *url = [NSURL URLWithString:URLStrings];
    [[HUWebImageDownloader sharedImageDownloader] downloadImageWithURL:url completed:^(UIImage *image, NSError *error, NSURL *imageUrl) {
        self.imageView.image = image;
    }];}

@end
