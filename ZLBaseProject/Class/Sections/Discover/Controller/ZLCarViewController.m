//
//  ZLCarViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLCarViewController.h"
#import "ZL_CollectionReusableView.h"
#import "ZLCollectionViewFlowLayout.h"

@interface ZLCarViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic ,strong) UICollectionView *collectionView;


@end

@implementation ZLCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Catergary"];
    
    [self setupLayout];
    
}

- (void)setupLayout{

    //创建CollectionView布局类的对象，UICollectionViewFlowLayout有水平和垂直两种布局方式，如果你需要做复杂的而已可以继承UICollectionViewFlowLayout创建你自己的布局类
    ZLCollectionViewFlowLayout *flow = [[ZLCollectionViewFlowLayout alloc]init];
    //指定布局方式为垂直
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumLineSpacing = 1;//最小行间距(当垂直布局时是行间距，当水平布局时可以理解为列间距)
    flow.minimumInteritemSpacing = 1;//两个单元格之间的最小间距
    
    //创建CollectionView并指定布局对象
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREENH_HEIGHT - 49 - 64) collectionViewLayout:flow];
    _collectionView.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"AA"];
    
    [_collectionView registerClass:[ZL_CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"H"];
    
//    注册用xib定制的cell，各参数的含义同UITableViewCell的注册
//    [_collectionView registerNib:[UINib nibWithNibName:@"GroupCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"GroupCellID"];

}

//协议的方法,用于返回section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

//协议中的方法，用于返回分区中的单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //UICollectionViewCell里的属性非常少，实际做项目的时候几乎必须以其为基类定制自己的Cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AA" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

//协议中的方法，用于返回单元格的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-4) / 4, (SCREEN_WIDTH-4) / 4);
}

//协议中的方法，用于返回整个CollectionView上、左、下、右距四边的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //上、左、下、右的边距
    return UIEdgeInsetsMake(1, 0, 1, 0);
}

//协议中的方法，用来返回分组头的大小。如果不实现这个方法，- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath将不会被调用
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    //宽度随便定，系统会自动取collectionView的宽度
    //高度为分组头的高度
    return CGSizeMake(0, 44);
}


//协议中的方法，用来返回CollectionView的分组头或者分组脚
//参数二：用来区分是分组头还是分组脚
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //重用分组头，因为前边注册过，所以重用一定会成功
    //参数一：用来区分是分组头还是分组脚
    //参数二：注册分组头时指定的ID
    if (kind == UICollectionElementKindSectionHeader) {
        ZL_CollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"H" forIndexPath:indexPath];
        
        header.str = @(indexPath.section).stringValue;
        
        return header;
        
    }else{
        return nil;
    }
}


@end
