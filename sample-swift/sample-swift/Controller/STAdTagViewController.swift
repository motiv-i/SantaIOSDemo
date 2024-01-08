//
//  STAdTagViewController.swift
//  sample-swift
//
//  Created by Jaeuk Jeong on 12/20/23.
//

import UIKit
import WebKit
import SantaSDK

class STAdTagViewController: UIViewController {

    @IBOutlet var webView: WKWebView!

    var info: STAdInfoModel?
    var adTagManager: STAdTagManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // WebView로 전달될 데이터 매니저 생성
        adTagManager = STAdTagManager()

        // 선택사항으로 미국 아동 온라인 사생활 보호법에 따라 13세 미만의 사용자를 설정하면 개인 정보를 제한하여 광고 입찰 처리됩니다. (IP, Device ID, Geo 정보등)
        adTagManager?.coppa = .False

        // 커스텀 메타 데이터
        adTagManager?.keywords(["key" : "value"])
        adTagManager?.keywords("key2", "value2")

        // 광고식별자 요청은 광고 요청 전에 완료되야합니다.
        adTagManager?.requestTrackingAuthorization() { _ in
            // 위치 - 사용자 승인 요청
            self.adTagManager?.requestLocation()

            // 광고식별자 요청이 완료된 후 처리
            let webViewConfig = WKWebViewConfiguration()

            webViewConfig.preferences.javaScriptEnabled = true
            webViewConfig.allowsInlineMediaPlayback = true
            webViewConfig.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypes.audio

            self.webView = WKWebView(frame: self.webView.frame, configuration: webViewConfig)
            self.webView.uiDelegate = self
            self.webView.navigationDelegate = self
            self.view.addSubview(self.webView)

            // 광고식별자 요청이 완료된 후 페이지 로딩이 되어야합니다.
            if let htmlFile = Bundle.main.path(forResource: "index", ofType: "html") {
                self.webView.load(URLRequest(url: URL(fileURLWithPath: htmlFile)))
            }
        }
    }
}

extension STAdTagViewController: WKUIDelegate {

}

extension STAdTagViewController: WKNavigationDelegate {

    // MARK: Javascript 주입 방법 - 페이지 로딩 전에 데이터를 주입 시킨다
    // 웹 컨텐츠를 수신하기 시작할때 데이터 바인딩
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // 기본 데이터 외 문서에 추가할 데이터
        let source = self.adTagManager?.makeSource(["custom_key" : "custom_value"]) ?? ""

        // json 형태로 데이터 주입
        webView.evaluateJavaScript("window.santa_sdk=\(source);", completionHandler: { result, error in
            if error != nil {
                print("ERROR : \(String(describing: error))")
            } else {
                // 성공
            }
        })
    }

}
