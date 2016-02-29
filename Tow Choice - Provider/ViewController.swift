//
//  ViewController.swift
//  Tow Choice - Provider
//
//  Created by Alicia Tan on 2/26/16.
//  Copyright © 2016 Tow Choice. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var loadingImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView: WKWebView = WKWebView(frame: CGRectMake(0, 0, view.bounds.width, view.bounds.height))
        webView.navigationDelegate = self
        view.addSubview(webView)
        webView.hidden = true
        view.autoresizesSubviews = true
//        let url = NSURL(string: "https://google.com")!

        let url = NSURL(string: "http://live.towchoice.com/provider/#signinpage")!
        webView.loadRequest(NSURLRequest(URL: url))
//        webView.loadHTMLString("", baseURL:NSURL(string: "http://live.towchoice.com/provider"))

//        webView.load

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadingImage.hidden = false
        loadingView.hidden = false
        loadingView.startAnimating()    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        print(navigationAction.request.URL)
        print(navigationAction.navigationType)
        decisionHandler(WKNavigationActionPolicy.Allow)

    }
    func webView(webView: WKWebView, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
        <#code#>
    }
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingView.startAnimating()
        loadingView.hidden = false
        webView.hidden = true
        NSLog("WebView started to load")
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        loadingView.stopAnimating()
        loadingView.hidden = true
        loadingImage.hidden = true
        webView.hidden = false
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        let alertVC = UIAlertController(title: "Request Failed", message: error.localizedDescription, preferredStyle: .Alert)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }

}

