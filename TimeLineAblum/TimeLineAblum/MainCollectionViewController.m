//
//  MainCollectionViewController.m
//  TimeLineAblum
//
//  Created by weiwei on 15/8/25.
//  Copyright (c) 2015年 weiwei. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "TimeLineCollectionViewCell.h"
#import "AlbumCollectionViewCell.h"

@interface MainCollectionViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *timeArray;

@property (nonatomic, strong) UICollectionView *timeLineCollection;
@property (nonatomic, strong) UICollectionView *AlbumCollection;

@end

@implementation MainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _timeArray = @[@"2015-01-29",@"2015-1-8",@"2014-12-29",@"2014-12-29",@"2014-12-29",@"2014-12-29"];
    _imageArray = @[@[@"0318"],
                    @[@"0319"],
                    @[@"0321",@"0324",@"0331",@"0332"],
                    @[@"0334",@"0335",@"0341",@"0343"],
                    @[@"0324",@"0335",@"0319"],
                    @[@"0318"]];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    UICollectionViewFlowLayout *timeLayout = [[UICollectionViewFlowLayout alloc] init];
    _timeLineCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 80, height-64) collectionViewLayout:timeLayout];
    _timeLineCollection.showsVerticalScrollIndicator = NO;
    _timeLineCollection.showsHorizontalScrollIndicator = NO;
    _timeLineCollection.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _timeLineCollection.delegate = self;
    _timeLineCollection.dataSource = self;
    [self.view addSubview:_timeLineCollection];
    
    [_timeLineCollection registerClass:[TimeLineCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UICollectionViewFlowLayout *imageLayout = [[UICollectionViewFlowLayout alloc] init];
    imageLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    imageLayout.minimumLineSpacing = 5.0f;
    _AlbumCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(80, 64, width-80, height-64) collectionViewLayout:imageLayout];
    _AlbumCollection.showsVerticalScrollIndicator = NO;
    _AlbumCollection.showsHorizontalScrollIndicator = NO;
    _AlbumCollection.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _AlbumCollection.delegate = self;
    _AlbumCollection.dataSource = self;
    [self.view addSubview:_AlbumCollection];
    
    [_AlbumCollection registerClass:[AlbumCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (collectionView == _AlbumCollection) {
        return _imageArray.count;
    } else {
        return _timeArray.count;
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == _AlbumCollection) {
        NSArray *array = _imageArray[section];
        return array.count;
    } else {
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == _AlbumCollection) {
        AlbumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        cell.imageName = _imageArray[indexPath.section][indexPath.row];
        // Configure the cell
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    
    else  {
        TimeLineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        cell.timeString = _timeArray[indexPath.section];
        // Configure the cell
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = (width-80-5*4)/3;
    if (collectionView == _timeLineCollection) {
        NSArray *array = _imageArray[indexPath.section];
        CGFloat count = ceil(array.count / 3.0);
        return CGSizeMake(80, count*height+(count-1)*5+10*2);
    } else {
        return CGSizeMake(height, height);
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _timeLineCollection) {
        [_AlbumCollection setContentOffset:_timeLineCollection.contentOffset];
    }else{
        [_timeLineCollection setContentOffset:_AlbumCollection.contentOffset];
    }
    
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
