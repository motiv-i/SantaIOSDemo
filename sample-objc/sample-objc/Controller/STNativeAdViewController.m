//
//  STNativeAdViewController.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STNativeAdViewController.h"
#import "STNAtiveAdView.h"
#import <SantaSDK/SantaSDK-Swift.h>

@interface STNativeAdViewController ()<STNativeAdDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textKeyword;
@property (weak, nonatomic) IBOutlet UIButton *btnLoadAd;

@property (nonatomic, strong) STNativeAd *nativeAd;


@end

@implementation STNativeAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.textKeyword.text = self.info.ID;
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

- (IBAction)loadAdClicked:(id)sender
{
    [self.textKeyword endEditing:YES];
    
    self.btnLoadAd.enabled = NO;
    [self clearAd];

    // Create and configure a renderer configuration for native ads.
    
    [STNativeAdManager initNativeAdWithAdUnitIdentifier:self.textKeyword.text :[STNativeAdView class]];
    [STNativeAdManager coppa:@"0"];
    [STNativeAdManager testing:YES];
    
    [STNativeAdManager startWithCompletionHandler:^(STNativeAdRequest *request, STNativeAd *response, NSError *error) {
        if (error) {
            NSLog(@"================> %@", error);
            [self configureAdLoadFail];
        } else {
            self.nativeAd = response;
            self.nativeAd.delegate = self;
            [self displayAd];
            NSLog(@"Received Native Ad");
        }
    }];

}

- (void)clearAd
{
    [[self.adViewContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.nativeAd = nil;
}

- (void)displayAd
{
    self.btnLoadAd.enabled = YES;
    
    [[self.adViewContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *adView = [self.nativeAd retrieveAdViewWithError:nil];
    [self.adViewContainer addSubview:adView];
    adView.frame = self.adViewContainer.bounds;
}

- (void)configureAdLoadFail
{
    self.btnLoadAd.enabled = YES;
}

#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    
    return YES;
}

#pragma mark - EBNativeAdDelegate

- (void)willLoadForNativeAd:(STNativeAd *)nativeAd
{
    NSLog(@"Will Load for native ad.");
}

- (void)didLoadForNativeAd:(STNativeAd *)nativeAd
{
    NSLog(@"Did Load for native ad.");
}

- (void)willLeaveApplicationFromNativeAd:(STNativeAd *)nativeAd
{
    NSLog(@"Will leave application from native ad.");
}

- (UIViewController *)viewControllerForPresentingModalView
{
    return self;
}

@end
