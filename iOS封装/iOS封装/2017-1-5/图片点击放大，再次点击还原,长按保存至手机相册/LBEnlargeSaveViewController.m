//
//  LBEnlargeSaveViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBEnlargeSaveViewController.h"
#import "HomeHornorpictureCollectionViewCell.h"
#import "HUPhotoBrowser.h"
#import "UIImageView+HUWebImage.h"

@interface LBEnlargeSaveViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@property (strong, nonatomic)NSMutableArray *dataarr;
@property (nonatomic, strong) NSMutableArray *URLStrings;
@property (nonatomic, assign)NSInteger savaindex;//将要保存图片的索引

@end

// 宏定义当前屏幕的宽度
#define size_width [UIScreen mainScreen].bounds.size.width
// 宏定义当前屏幕的高度
#define size_height [UIScreen mainScreen].bounds.size.height
@implementation LBEnlargeSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
      self.title=@"图片点击放大，再次点击还原,长按保存至手机相册";
     [self.collectionview registerNib:[UINib nibWithNibName:@"HomeHornorpictureCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HomeHornorpictureCollectionViewCell"];
    
    [self setUpCollectionView];
    
    UIImage *ima=[UIImage imageNamed:@"banner01"];
    
    _dataarr=[NSMutableArray arrayWithObjects:ima,ima,ima,ima,ima,ima,ima,ima,ima,ima,ima,ima, nil];
    _URLStrings=[[NSMutableArray alloc]init];
    
}

-(void)setUpCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;//列间距
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake((size_width-30)/3,(size_width-30)/3+17);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionview.collectionViewLayout = layout;
    self.collectionview.showsVerticalScrollIndicator = NO;
    self.collectionview.backgroundColor = [UIColor clearColor];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataarr.count;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeHornorpictureCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"HomeHornorpictureCollectionViewCell" forIndexPath:indexPath];
    
    cell.picImage.image=[UIImage imageNamed:@"banner01"];
    cell.index=indexPath.item;
    
    cell.longtouchBlock=^(NSInteger index){
        _savaindex=index;
        UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"" message:@"确定要保存该图片吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [view show];
    };
    
    return cell;
    
}


//选择cell时
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeHornorpictureCollectionViewCell *cell = (HomeHornorpictureCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //本地图片
        [HUPhotoBrowser showFromImageView:cell.picImage withImages:self.dataarr placeholderImage:nil atIndex:indexPath.row dismiss:nil];
    //网络图片
       //[HUPhotoBrowser showFromImageView:cell.picImage withURLStrings:_URLStrings atIndex:indexPath.row];
    
}
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
    
}

-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}


#pragma mark ----UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        
         UIImageWriteToSavedPhotosAlbum(self.dataarr[_savaindex], self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    }
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    if (error == nil) {
        
        
    }else{
       
    
    }
}
@end
