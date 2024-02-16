//
//  STBannerAdViewController.swift
//  swift-sample
//
//  Created by Jaeuk Jeong on 12/15/23.
//

import UIKit
import SantaSDK

/**
 * 배너 320 x 50
 */
class STBannerAdViewController: UIViewController {

    @IBOutlet var textKeyword: UITextField!
    @IBOutlet var btnLoadAd: UIButton!
    @IBOutlet var adViewContainer: UIView!

    var info: STAdInfoModel?

    // 광고 컨트롤 객체
    var adView : STAdView?
    var medistions: IndexingIterator<Array<String>>?

    override func viewDidLoad() {
        super.viewDidLoad()

        textKeyword.text = info?.ID
    }
}

extension STBannerAdViewController {

    @IBAction func loadAdClick(_ sender: UIButton) {

        guard let adUnitId = self.textKeyword.text else {
            return
        }

        // 광고가 뷰에 보여지고 있다면 지우고 객체 해제
        if let adView = self.adView {
            adView.removeFromSuperview()
            self.adView = nil
        }

        self.textKeyword.resignFirstResponder()

        // 광고 객체 초기화 - (adUnitId는 유닛을 등록 후 발급된 ID)
        self.adView = STAdView(adUnitId: adUnitId, size: self.adViewContainer.frame.size)

        if let adView = self.adView {
            adView.delegate = self      // 대리자 전달
            adView.keywords = ["test" : "A"]
            adView.testing = true       // 광고 테스트 여부

            // 광고 위치에 광고 뷰 추가
            self.adViewContainer.addSubview(adView)

            // 광고 뷰를 위치에 맞게 수정
            // 직접 처리할 수 있다면 호출할 필요 없음
            self.setAutoLayout(view: self.adViewContainer, adView: adView)
            adView.loadAd()
        }
    }
    
    func loadMediation() {
        // 미디에이션 목록이 존재할때
        if self.medistions != nil {
            
            // 미디에이션 목록을 순차로 가져온다
            if let medistion = self.medistions?.next() {
                print("loadMediation = \(medistion)")
                
                // 사용할 미이데이션에 맞는 광고 호출 코드를 작성
                switch medistion {
                case "Mediation Name":
                    print("Mediation Name")
                default:
                    print("Mediation Default")
                }
                
            } else {
                print("Mediation is Empty")
            }
        } else {
            print("Mediation is Empty")
        }
    }
}

extension STBannerAdViewController: STAdViewDelegate {
    /**
     * 광고를 성공적으로로드하면 전송됩니다.
     *
     * 아직 삽입하지 않은 경우이 메소드를 구현하여보기 계층 구조에 광고보기를 삽입해야합니다.
     *
     * @param  광고뷰
     */
    func adViewDidLoadAd(_ view: SantaSDK.STAdView?) {
        print("adViewDidLoadAd")
    }

    /**
     * 광고로드에 실패 할 때 전송됩니다.
     */
    func adViewDidFailToLoadAd(_ view: SantaSDK.STAdView?) {
        print("adViewDidFailToLoadAd")
    }

    /**
     * 콘텐츠를로드하려고 할 때 전송됩니다.
     */
    func willLoadViewForAd(_ view: SantaSDK.STAdView?) {
        print("willLoadViewForAd")
    }

    /**
     *  모달 콘텐츠를 닫았을 때 전송되어 애플리케이션에 제어권을 반환합니다.
     */
    func didLoadViewForAd(_ view: SantaSDK.STAdView?) {
        print("didLoadViewForAd")
    }

    /**
     * 사용자가 광고를 탭하여 애플리케이션에서 나 가려고 할 때 전송됩니다.
     */
    func willLeaveApplicationFromAd(_ view: SantaSDK.STAdView?) {
        print("willLeaveApplicationFromAd")
    }
    
    /**
     * 광고가 비어있으며 미디에이션이 존재할 때 전송됩니다.
     */
    func adViewDidLoadMediation(_ mediations: [String]?) {
        self.medistions = mediations?.makeIterator()
        self.loadMediation()
    }
}
