//
//  STNativeAdViewController.swift
//  sample-swift
//
//  Created by Jaeuk Jeong on 12/18/23.
//

import UIKit
import SantaSDK

class STNativeAdViewController: UIViewController {

    @IBOutlet var textKeyword: UITextField!
    @IBOutlet var btnLoadAd: UIButton!
    @IBOutlet var adViewContainer: UIView!

    var info: STAdInfoModel?
    var nativeAd: STNativeAd?

    override func viewDidLoad() {
        super.viewDidLoad()

        textKeyword.text = info?.ID
    }

}

extension STNativeAdViewController {

    @IBAction func loadAdClick(_ sender: UIButton) {
        guard let adUnitId = self.textKeyword.text else {
            return
        }

        btnLoadAd.isEnabled = false

        clearAd()

        STNativeAdManager.initNativeAdWithAdUnitIdentifier(adUnitId, STNativeAdView.self)
        STNativeAdManager.adFormat([.NATIVE])
        STNativeAdManager.testing(true)

        STNativeAdManager.startWithCompletionHandler { (request, response, error) in
            if error != nil {
                self.configureAdLoadFail()
            } else {
                self.nativeAd = response
                self.nativeAd?.delegate = self
                self.displayAd()
            }
        }

    }

    func clearAd() {
        adViewContainer.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        nativeAd = nil
    }

    func displayAd() {
        btnLoadAd.isEnabled = true
        adViewContainer.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        if let adView = nativeAd?.retrieveAdViewWithError(nil) {
            adViewContainer.addSubview(adView)
            setAutoLayout2(view: adViewContainer, adView: adView)
        }
    }

    func configureAdLoadFail() {
        btnLoadAd.isEnabled = true
        print("Fail Load Ad")
    }

}

extension STNativeAdViewController: STNativeAdDelegate {
    /**
     * 네이티브 광고가 모달 콘텐츠를 표시 할 때 전송됩니다.
     */
    func willLoadForNativeAd(_ nativeAd: STNativeAd?) {
        print("willLoadForNativeAd")
    }

    /**
     * 네이티브 광고가 모달 콘텐츠를 닫았을 때 전송되어 애플리케이션에 제어권을 반환합니다.
     */
    func didLoadForNativeAd(_ nativeAd: STNativeAd?) {
        print("didLoadForNativeAd")
    }

    /**
     * 사용자가이 기본 광고를 탭한 결과로 애플리케이션에서 나 가려고 할 때 전송됩니다.
     */
    func willLeaveApplicationFromNativeAd(_ nativeAd: STNativeAd?) {
        print("willLeaveApplicationFromNativeAd")
    }

    /**
     * 광고를 탭할 때 나타날 수있는 인앱 브라우저와 같은 모달 콘텐츠를 표시하는 데 사용할 뷰 컨트롤러를 대리인에게 요청합니다.
     */
    func viewControllerForPresentingModalView() -> UIViewController? {
        return self
    }
}
