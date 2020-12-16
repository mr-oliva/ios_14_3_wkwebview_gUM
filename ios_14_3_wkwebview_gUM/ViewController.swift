//
//  ViewController.swift
//  ios_14_3_wkwebview_gUM
//
//  Created by mr-oliva on 2020/12/16.
//
import WebKit
import UIKit

class ViewController: UIViewController, WKNavigationDelegate, UIScrollViewDelegate, WKUIDelegate {
    @IBOutlet var webView: WKWebView!

    override func loadView() {
        super.loadView()
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        webView = WKWebView(frame: .zero , configuration: config)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.scrollView.delegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // room
        let url = URL(string:"https://5fd94ef5a58ede015c91fc5d--nervous-boyd-ea1926.netlify.app/")!
        //p2p call
        //let url = URL(string: "https://5fd9d5ec9a2cdea901675d6d--nervous-boyd-ea1926.netlify.app/")!
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard #available(iOS 14.2, *) else {
            webView.evaluateJavaScript("delete navigator.__proto__.mediaDevices")
            return
        }
    }
}

