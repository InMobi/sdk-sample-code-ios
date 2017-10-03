//
//  IMStrandsViewController.m
//  Ads Demo
//
//  Copyright © 2016 Inmobi. All rights reserved.
//

#import "IMNativeViewController.h"
#import <InMobiSDK/InMobiSDK.h>
#import "IMSimpleTableCell.h"
#import "IMAppIds.h"

#define kIMAdInsertionPosition 5
@interface IMNativeViewController() <IMNativeDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) IMNative *native;
@property (nonatomic) BOOL nativeStrandsLoaded,nativeStrandsRendered,nativeStrandsInserted;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableData;
@end
@implementation IMNativeViewController
- (void)viewDidLoad {
    self.tableData = [[NSMutableArray alloc] init];
    [self loadInitialData];
    [self loadInitialData];
    if(self.isStoryBoard){
        self.native = [[IMNative alloc] initWithPlacementId:INMOBI_NATIVE_STORYBOARD];
    }
    else{
        self.native = [[IMNative alloc] initWithPlacementId:INMOBI_NATIVE_MOVIEBOARD];
    }
    self.native.delegate = self;
    [self.native load];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView addObserver:self
                     forKeyPath:@"contentOffset"
                        options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                        context:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isAdAtIndexPath:indexPath]) {
        UITableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"adIdentifier"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"adIdentifier"];
        }
        IMNative *strands = [self.tableData objectAtIndex:indexPath.row];
        [cell addSubview:[strands primaryViewOfWidth:cell.frame.size.width]];
        return cell;
    } else {
        IMSimpleTableCell *cell = (IMSimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:@"SimpleTableCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableCell"];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            id slide = [self.tableData objectAtIndex:indexPath.row];
            SampleData *current_slide = slide;
            cell.Title.text = current_slide.title;
            cell.SubTitle.text = current_slide.subtitle;
            cell.Time_tt.text = current_slide.time;
            cell.Description_dd.text = current_slide.description_tt;
            cell.thumbnailImageView.image = [UIImage imageNamed:current_slide.thumbimage];
            cell.BigImageView.image = [UIImage imageNamed:current_slide.bigimage];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isAdAtIndexPath:indexPath]) {
        UIView *adView = [self.native primaryViewOfWidth:tableView.contentSize.width];
        return adView.frame.size.height;
    }
    CGFloat height= 428;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        height = 502;
    }
    return height;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView.indexPathsForVisibleRows indexOfObject:indexPath] == NSNotFound && [self isAdAtIndexPath:indexPath]) {
        [self.native recyclePrimaryView];
    }
}

#pragma mark - Internal Methods
- (void)loadInitialData {
    SampleData *item1 = [[SampleData alloc] init];
    item1.title = @"Neha Jha";
    item1.subtitle = @"Product Manager";
    item1.time = @"1:50 AM";
    item1.description_tt = @"Looking out for a Sponsorship Manager with 5+ yrs exp for a sports tourism company in Bangalore with strong grasp of media planning principles & excellent understanding of target segment, market intelligence and media medium technicalities. For more infos contact me at neha@zyoin.com";
    item1.thumbimage = @"neha_jha.jpg";
    item1.bigimage = @"neha_jha_big.png";
    [self.tableData addObject:item1];
    
    SampleData *item2 = [[SampleData alloc] init];
    item2.title = @"Nazia Firdose";
    item2.subtitle = @"HR";
    item2.time = @"9:50 AM";
    item2.description_tt = @"Please pray for these children in Syria after the death of their mother. The oldest sister has to take care of her younger siblings. -Ayad L Gorgees. ***Please don't scroll past without Typing Amen! because they need our prayers!!";
    item2.thumbimage = @"nazia.jpg";
    item2.bigimage = @"nazia_big.png";
    [self.tableData addObject:item2];
    
    SampleData *item3 = [[SampleData alloc] init];
    item3.title = @"Dharmesh Shah";
    item3.subtitle = @"Founder at HubSpot";
    item3.time = @"4:50 PM";
    item3.description_tt = @"Why, dear God, haven't you started marketing yet? http://dharme.sh/1Ewu63k by @gjain via @Inboundorg";
    item3.thumbimage = @"dharmesh.jpg";
    item3.bigimage = @"dharmesh_big.png";
    [self.tableData addObject:item3];
    
    SampleData *item4 = [[SampleData alloc] init];
    item4.title = @"Piyush Shah";
    item4.subtitle = @"CPO";
    item4.time = @"6:50 PM";
    item4.description_tt = @"With mobile being accepted as the definitive medium to access consumers’ minds and wallets, Brands have begun a multi-million dollar spending race to allure and retain customers.  Read on: https://lnkd.in/e8mcUfc";
    item4.thumbimage = @"piyush.jpg";
    item4.bigimage = @"piyush_big.png";
    [self.tableData addObject:item4];
    
    SampleData *item5 = [[SampleData alloc] init];
    item5.title = @"Jeff Weiner";
    item5.subtitle = @"CEO at Linkedin";
    item5.time = @"4:10 AM";
    item5.description_tt = @"Honored to represent LinkedIn's Economic Graph capabilities at the White House earlier today and partnering to Upskill America.";
    item5.thumbimage = @"jeff.jpg";
    item5.bigimage = @"jeff_big.png";
    [self.tableData addObject:item5];
}

- (BOOL)isAdAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.tableData objectAtIndex:indexPath.row] isKindOfClass:[IMNative class]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isEqual:_tableView] && [keyPath isEqualToString:@"contentOffset"]) {
        [self updateTableData];
    }
}

- (void)updateTableData {
    if (!self.nativeStrandsLoaded || self.nativeStrandsInserted) {
        return;
    }
    NSArray *visibleArray = self.tableView.indexPathsForVisibleRows;
    NSIndexPath *lastVisibleCell = visibleArray.lastObject;
    if (kIMAdInsertionPosition > lastVisibleCell.row) {
        self.nativeStrandsInserted = YES;
        [self.tableData insertObject:self.native atIndex:kIMAdInsertionPosition];
        [self.tableView reloadData];
    }
}

#pragma mark - IMNativeDelegate

/**
 * Notifies the delegate that the native ad has finished loading
 */
-(void)nativeDidFinishLoading:(IMNative*)native{
    self.nativeStrandsLoaded = YES;
    [self updateTableData];
    NSLog(@"Native Strands did finish load");
}
/**
 * Notifies the delegate that the native ad has failed to load with error.
 */
-(void)native:(IMNative*)native didFailToLoadWithError:(IMRequestStatus*)error{
    NSLog(@"Error : %@",error.description);
}
/**
 * Notifies the delegate that the native ad would be presenting a full screen content.
 */
-(void)nativeWillPresentScreen:(IMNative*)native{
    NSLog(@"Native Strands Ad Clicked");
}
/**
 * Notifies the delegate that the native ad has presented a full screen content.
 */
-(void)nativeDidPresentScreen:(IMNative*)native{
    NSLog(@"Native Strands Ad Clicked");
}
/**
 * Notifies the delegate that the native ad would be dismissing the presented full screen content.
 */
-(void)nativeWillDismissScreen:(IMNative*)native{
    NSLog(@"Native Strands Ad Clicked");
}
/**
 * Notifies the delegate that the native ad has dismissed the presented full screen content.
 */
-(void)nativeDidDismissScreen:(IMNative*)native{
    NSLog(@"Native Strands Ad Clicked");
}
/**
 * Notifies the delegate that the user will be taken outside the application context.
 */
-(void)userWillLeaveApplicationFromNative:(IMNative*)native{
    NSLog(@"Native Ad User will leave application");
}
/**
 * Notifies the delegate that the native ad impression has been tracked
 */
-(void)nativeAdImpressed:(IMNative*)native{
    NSLog(@"Native Ad Impression");
}
/**
 * Notifies the delegate that the user has performed the action to be incentivised with.
 */
-(void)native:(IMNative*)native rewardActionCompletedWithRewards:(NSDictionary*)rewards{
    NSLog(@"Native Reward Action Completed");
}
/**
 * Notifies the delegate that the native ad has been interacted with.
 */
-(void)native:(IMNative*)native didInteractWithParams:(NSDictionary*)params{
    NSLog(@"Native Interacted with Ad");
}
/**
 * Notifies the delegate that the native ad has finished playing media.
 */
-(void)nativeDidFinishPlayingMedia:(IMNative*)native{
    NSLog(@"Native Playing Video Finished");
}

- (void)dealloc {
    self.native.delegate = nil;
    [self.tableView removeObserver:self
                    forKeyPath:@"contentOffset"
                       context:nil];
}
@end
