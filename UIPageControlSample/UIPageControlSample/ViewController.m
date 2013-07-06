//
//  ViewController.m
//  UIPageControlSample
//
//  Created by Dolice on 2013/07/06.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.frame = CGRectMake( 0, self.view.bounds.size.height - 30, 320, 30 );
    _pageControl.backgroundColor = [UIColor blackColor];
    [_pageControl addTarget:self
                     action:@selector(pageControlDidChange:)
           forControlEvents:UIControlEventValueChanged];
    _pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
    UIBarButtonItem* addButton =
    [[UIBarButtonItem alloc] initWithTitle:@"ページ追加"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(addDidPush)];
    UIBarButtonItem* delButton =
    [[UIBarButtonItem alloc] initWithTitle:@"ページ削除"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(delDidPush)];
    NSArray* items = [NSArray arrayWithObjects:addButton, delButton, nil];
    [self setToolbarItems:items animated:NO];
}

- (void)pageControlDidChange:(id)sender {
    //ここでページコントロールの表示を更新する
    
}

- (void)addDidPush {
    if ( 10 > _pageControl.numberOfPages ) {
        ++_pageControl.numberOfPages;
    }
}

- (void)delDidPush {
    if ( 1 < _pageControl.numberOfPages ) {
        --_pageControl.numberOfPages;
        [self pageControlDidChange:_pageControl];
    }
}

@end
