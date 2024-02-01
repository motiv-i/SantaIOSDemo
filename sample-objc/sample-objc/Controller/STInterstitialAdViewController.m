//
//  STInterstitialAdViewController.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STInterstitialAdViewController.h"
#import <SantaSDK/SantaSDK-Swift.h>

@interface STInterstitialAdViewController ()<STInterstitialAdViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textKeyword;
@property (weak, nonatomic) IBOutlet UIButton *btnLoadAd;
@property (weak, nonatomic) IBOutlet UIButton *btnShowAd;

@property (nonatomic, strong) STInterstitialAdView *interstitial;

@end

@implementation STInterstitialAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.textKeyword.text = self.info.ID;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapLoadButton:(id)sender
{
    [self.textKeyword endEditing:YES];
    
    self.btnShowAd.hidden = YES;
    self.btnLoadAd.enabled = NO;
    
    self.interstitial = [STInterstitialAdView interstitialAdControllerForAdUnitId:self.textKeyword.text];

    self.interstitial.delegate = self;
    self.interstitial.testing = YES;
    [self.interstitial loadAd];
}

- (IBAction)didTapShowButton:(id)sender
{
    [self.interstitial showFromViewController:self];
}

#pragma mark - <EBInterstitialAdControllerDelegate>

- (void)interstitialDidLoadAd:(STInterstitialAdView *)interstitial
{
    self.btnShowAd.hidden = NO;
    self.btnLoadAd.enabled = YES;
}

- (void)interstitialDidFailToLoadAd:(STInterstitialAdView *)interstitial
{
    self.btnLoadAd.enabled = YES;
}

- (void)interstitialDidExpire:(STInterstitialAdView *)interstitial
{
    self.btnLoadAd.enabled = YES;
    self.btnShowAd.hidden = YES;
}

- (void)interstitialWillAppear:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialDidAppear:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialWillDisappear:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialDidDisappear:(STInterstitialAdView *)interstitial
{
    self.btnShowAd.hidden = YES;
}

- (void)interstitialDidReceiveTapEvent:(STInterstitialAdView *)interstitial
{
}


@end
