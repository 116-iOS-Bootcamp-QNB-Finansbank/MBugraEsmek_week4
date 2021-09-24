//
//  WebViewContainerViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 18.09.2021.
//

import UIKit
import WebKit

class WebViewContainerViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad() // html content gosterelim font ve font buyuklugunu css ile degistirelim

        // Do any additional setup after loading the view.
        
//        let preferences = WKPreferences()
//        preferences.javaScriptEnabled = true
//
//        let configuration = WKWebViewConfiguration()
//        configuration.preferences = preferences
        
        activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = .red
        activityIndicatorView.startAnimating()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicatorView)
        
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: TimeInterval(8))
        
        webView.allowsBackForwardNavigationGestures = true
        webView.load(urlRequest)
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.isLoading),
                            options: .new,
                            context: nil)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    private var activityIndicatorView: UIActivityIndicatorView!
    
    var urlString: String!
    
//    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "loading" {
//            if webView.isLoading {
//
//            }
//        }
//    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicatorView.startAnimating()
            } else {
                activityIndicatorView.stopAnimating()
            }
            
            activityIndicatorView.isHidden = !webView.isLoading
        }
    }
    @IBAction func reloadButtonTapped(_ sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func forwardButtonTapped(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        guard let url = webView.url else { return  }

                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    
                    UIApplication.shared.openURL(url)
                }
    }
    @IBAction func refreshButtonTapped(_ sender: Any) {
        webView.reload()
    }
}

extension WebViewContainerViewController: WKUIDelegate {
    
}

extension WebViewContainerViewController: WKNavigationDelegate {
    
}
