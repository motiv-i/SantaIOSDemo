//
//  STBannerAdViewController.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STBannerAdViewController.h"
#import <SantaSDK/SantaSDK-Swift.h>

@interface STBannerAdViewController ()<UITextFieldDelegate, STAdViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textKeyword;
@property (weak, nonatomic) IBOutlet UIButton *loadAdButton;

@property (nonatomic, strong) STAdView *adView;
@property (nonatomic, strong) NSEnumerator<NSString *> *mediations;

@end

@implementation STBannerAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textKeyword.text = self.info.ID;
   [self.loadAdButton.layer setCornerRadius:3.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadAdClicked:(id)sender
{
    if (self.adView) {
        [self.adView removeFromSuperview];
    }
    [_textKeyword resignFirstResponder];
    
    self.adView = [[STAdView alloc] initWithAdUnitId:self.textKeyword.text size:_adViewContainer.bounds.size];
    self.adView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.adView.delegate = self;
    self.adView.testing = true;
    
    [self.adViewContainer addSubview:self.adView];
    
    // 광고 뷰를 오토레이아웃 설정
    // 직접 처리할 수 있다면 호출할 필요 없음
    [self setAdViewAutolayoutConstraint:self.adViewContainer mine:self.adView];
    
    [self.adView loadAd];
}

- (void)loadMediation
{
    // 미디에이션 목록이 존재할때
    if (self.mediations != nil) {
        // 미디에이션 목록을 순차로 가져온다
        NSString *mediation = [self.mediations nextObject];
        
        NSLog(@"loadMediation = %@", mediation);
        
        // 미디에이션이 비어있다면 목록을 모두 순회함
        if (mediation != nil) {
            if ([mediation isEqual: @"Mediation Name"]) {
                // 사용할 미이데이션에 맞는 광고 호출 코드를 작성
            }
        } else {
            NSLog(@"Mediation is Empty");
        }
    } else {
        NSLog(@"Mediation is Empty");
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)setAdViewAutolayoutConstraint:(UIView *)target mine:(UIView *)_mine
{
    [_mine setTranslatesAutoresizingMaskIntoConstraints:NO];
    [target addConstraint:[NSLayoutConstraint
                           constraintWithItem:_mine
                           attribute:NSLayoutAttributeTop
                           relatedBy:NSLayoutRelationEqual
                           toItem:target
                           attribute:NSLayoutAttributeTop
                           multiplier:1
                           constant:0]];
    
    [target addConstraint:[NSLayoutConstraint
                           constraintWithItem:_mine
                           attribute:NSLayoutAttributeBottom
                           relatedBy:NSLayoutRelationEqual
                           toItem:target
                           attribute:NSLayoutAttributeBottom
                           multiplier:1
                           constant:0]];
    
    [target addConstraint:[NSLayoutConstraint
                           constraintWithItem:_mine
                           attribute:NSLayoutAttributeLeading
                           relatedBy:NSLayoutRelationEqual
                           toItem:target
                           attribute:NSLayoutAttributeLeading
                           multiplier:1
                           constant:0]];
    
    [target addConstraint:[NSLayoutConstraint
                           constraintWithItem:_mine
                           attribute:NSLayoutAttributeTrailing
                           relatedBy:NSLayoutRelationEqual
                           toItem:target
                           attribute:NSLayoutAttributeTrailing
                           multiplier:1
                           constant:0]];
    
    CGFloat _height = 0.0f;
    _height = 50.0f;
    
    [target addConstraint:[NSLayoutConstraint
                           constraintWithItem:_mine
                           attribute:NSLayoutAttributeHeight
                           relatedBy:NSLayoutRelationEqual
                           toItem:nil
                           attribute:NSLayoutAttributeNotAnAttribute
                           multiplier:1
                           constant:_height]];
    
    [_mine setNeedsUpdateConstraints];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textKeyword resignFirstResponder];
}

- (UIViewController *)viewControllerForPresentingModalView
{
    return self;
}

#pragma mark - <STAdViewDelegate>

- (void)adViewDidLoadAd:(STAdView *)view {
    NSLog(@"adViewDidLoadAd");
}

- (void)adViewDidFailToLoadAd:(STAdView *)view
{
    NSLog(@"adViewDidFailToLoadAd");
}

- (void)willLoadViewForAd:(STAdView *)view {
    NSLog(@"willLoadViewForAd");
}

- (void)didLoadViewForAd:(STAdView *)view {
    NSLog(@"didLoadViewForAd");
}

- (void)willLeaveApplicationFromAd:(STAdView *)view {
    NSLog(@"willLeaveApplicationFromAd");
}

- (void)adViewDidLoadMediation:(NSArray<NSString *> *)mediations
{
    self.mediations = [mediations objectEnumerator];
    [self loadMediation];
}

@end
