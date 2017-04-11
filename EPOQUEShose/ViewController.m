//
//  ViewController.m
//  EPOQUEShose
//
//  Created by EPOQUE on 01/04/2017.
//  Copyright © 2017 JalynnXi. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"
#import <SceneKit/SceneKit.h>
#import "CardLayOut.h"
#import "ShowboardCollectionViewCell.h"
#import "customeShoseViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;
@property (strong, nonatomic) NSMutableArray *colors;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    self.title = @"模型预览";
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
    
    
//    [self changecloses];
    [self loadCard];
    
    
}

-(void)loadCard{
    
    CardLayOut *layout = [CardLayOut new];
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.scale = 1.1;
    layout.itemSize = CGSizeMake(kScreenWidth*0.7, kScreenHeight*0.6);
    CGRect frame = CGRectMake(15, -64, self.view.bounds.size.width, self.view.bounds.size.height);
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = NO;
    self.collectionView.alwaysBounceHorizontal = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
//    self.collectionView.backgroundView = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
    [self.view addSubview:self.collectionView];

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UINib *nib = [UINib nibWithNibName:@"ShowboardCollectionViewCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"CellID"];
    ShowboardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    cell.layer.cornerRadius = 5;
    cell.shoseImageView.image = [UIImage imageNamed:@"1.png"];
    cell.shoseNameLabel.text = @"高跟👠";
    return cell;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:CGPointMake(scrollView.contentOffset.x+0.5*scrollView.bounds.size.width, 0.5*scrollView.bounds.size.height)];
//    if (!indexPath || self.currentIndexPath == indexPath) {
//        return;
//    }
//    self.currentIndexPath = indexPath;
//    
//}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    customeShoseViewController *customeShoseVC = [[customeShoseViewController alloc]init];
    [self.navigationController pushViewController:customeShoseVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
