//
//  STAdTableViewController.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STAdTableViewController.h"
#import "STAdInfo.h"
#import "STAdSection.h"
#import "STBannerAdViewController.h"
#import "STInterstitialAdViewController.h"
#import "STNativeAdViewController.h"
#import <SantaSDK/SantaSDK-Swift.h>

@interface STAdTableViewController()

@property (nonatomic, strong) NSArray *sections;

@end

@implementation STAdTableViewController

- (STAdInfo *)infoAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.sections[indexPath.section] adAtIndex:indexPath.row];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= EB_IOS_7_0
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.sections = [STAdSection adSections];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  
    STAdInfo *info = [self infoAtIndexPath:(NSIndexPath *)sender];
  
    if ([[segue identifier] isEqualToString:@"Banner"]) {
        STBannerAdViewController *contoller = (STBannerAdViewController *)[segue destinationViewController];
        contoller.info = info;
    }else if ([[segue identifier] isEqualToString:@"Interstitial"]){
        STInterstitialAdViewController *contoller = (STInterstitialAdViewController *)[segue destinationViewController];
        contoller.info = info;
    }else if ([[segue identifier] isEqualToString:@"Native"]){
        STNativeAdViewController *contoller = (STNativeAdViewController *)[segue destinationViewController];
        contoller.info = info;
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sections[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    STAdInfo *info = [self infoAtIndexPath:indexPath];
    
    cell.textLabel.text = info.title;
//    cell.detailTextLabel.text = info.ID;
    cell.textLabel.textColor = [UIColor colorWithRed:0.32 green:0.36 blue:0.35 alpha:1];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:1];

    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sections[section] title];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STAdInfo *info = [self infoAtIndexPath:indexPath];
    
    switch (info.type) {
        case STAdInfoBanner:
            [self performSegueWithIdentifier:@"Banner" sender:indexPath];
            break;
        case STAdInfoInterstitial:
            [self performSegueWithIdentifier:@"Interstitial" sender:indexPath];
            break;
        case STAdInfoNative:
            [self performSegueWithIdentifier:@"Native" sender:indexPath];
            break;
        default:
            break;
    }
}
@end


