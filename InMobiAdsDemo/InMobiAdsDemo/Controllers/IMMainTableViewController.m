//
//  IMMainTableViewController.m
//  Ads Demo
//
//  
//  Copyright (c) 2015 Inmobi. All rights reserved.
//

#import "IMMainTableViewController.h"
#import "IMClassicAdViewController.h"
#import "IMClassicAdViewController_IB.h"
#import "IMNativeViewController.h"
#import "IMSplashViewController.h"
#import "IMPreRollViewController.h"
#import "IMAppIds.h"

@interface IMMainTableViewController ()

@property (nonatomic, strong) NSArray *adTypesArray;
@property (nonatomic,strong) IMSplashViewController *splashVC;
@property (nonatomic,strong) IMPreRollViewController *preRollVC;

@end

@implementation IMMainTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [self.navigationController.navigationBar setTintColor:RGBToUIColor(101, 151, 213)];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"AdOptions" ofType:@"plist"];
    _adTypesArray = [NSArray arrayWithContentsOfFile:plistPath];
    [self.tableView reloadData];

}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return _adTypesArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSDictionary *options = [_adTypesArray objectAtIndex:section];
    NSArray *types = options[@"Types"];
    
    return types.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adTypeCell"  forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *options = [_adTypesArray objectAtIndex:indexPath.section];
    NSArray *types = options[@"Types"];

    cell.textLabel.text = [[types objectAtIndex:indexPath.row] objectForKey:@"Title"];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *options = [_adTypesArray objectAtIndex:section];
    return options[@"Title"];
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.splashVC = [[IMSplashViewController alloc] init];
    self.preRollVC = [[IMPreRollViewController alloc] init];
    
    NSDictionary *options = [_adTypesArray objectAtIndex:indexPath.section];
    NSArray *types = options[@"Types"];

    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0 || indexPath.row == 1) {
               [self performSegueWithIdentifier:@"strandsSegue" sender:[types objectAtIndex:indexPath.row]];
            } else if(indexPath.row==2) {
                self.splashVC.placementID = SPLASH_NATIVE;
                [self.navigationController pushViewController:self.splashVC animated:true];
            } else {
                self.preRollVC.placementID = PREROLL_NATIVE;
                [self.navigationController pushViewController:self.preRollVC animated:true];
            }
            break;
        case 1:
            if (indexPath.row == 1) {//Expandable Banner
                [self performSegueWithIdentifier:@"classicAdSegueIB" sender:[types objectAtIndex:indexPath.row]];
            } else if(indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4) {
                //Case for Native Video , Web Video , Native Static and Normal Banner in sequential order
                [self performSegueWithIdentifier:@"classicAdSegue" sender:[types objectAtIndex:indexPath.row]];
            } else {
                //Case for Normal Banner
                [self performSegueWithIdentifier:@"classicAdSegue" sender:[types objectAtIndex:indexPath.row]];
            }
            break;
        default:
            break;
    }
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"classicAdSegue"]) {
        IMClassicAdViewController *adVC = segue.destinationViewController;
        adVC.adItem = sender;
    } else if ([segue.identifier isEqualToString:@"classicAdSegueIB"]) {
        IMClassicAdViewController_IB *adVC = segue.destinationViewController;
        adVC.adItem = sender;
    } else if ([segue.identifier isEqualToString:@"strandsSegue"]) {
        IMNativeViewController *adVC = segue.destinationViewController;
        if([sender valueForKey:@"Title"]){
            adVC.isStoryBoard = [[sender valueForKey:@"Title"] isEqualToString:@"Native Story Boards"];
        }
    }
}

@end
