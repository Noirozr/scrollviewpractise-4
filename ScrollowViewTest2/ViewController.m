//
//  ViewController.m
//  ScrollowViewTest2
//
//  Created by Yongjia Liu on 13-9-1.
//  Copyright (c) 2013年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect screen=[UIScreen mainScreen].bounds;
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height-20)];
    self.scrollView=scrollView;
    scrollView.delegate=self;
    [scrollView setMinimumZoomScale:1];
    [scrollView setMaximumZoomScale:3];
    [self.view addSubview:scrollView];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height-20)];
    self.imageView=imageView;
    [imageView setImage:[UIImage imageNamed:@"pic@2x.jpg"]];
	imageView.contentMode=UIViewContentModeScaleAspectFit;
    [scrollView addSubview:imageView];
    UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap)];// Do any additional setup after loading the view, typically from a nib.
    [tapGesture setNumberOfTapsRequired:2];
    [scrollView addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView*)scrollView
{
    return self.imageView;
}
-(void)onTap
{
    float scale=self.scrollView.zoomScale;
    if (scale>1.5) {
        [self.scrollView setZoomScale:1 animated:YES];
    }
    else{
        [self.scrollView setZoomScale:3 animated:YES];
    }
}
@end
