//
//  ViewController.swift
//  Tow Choice - Provider
//
//  Created by Alicia Tan on 2/26/16.
//  Copyright © 2016 Tow Choice. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var loadingImage: UIImageView!
    lazy var webView = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        webView.delegate = self
        view.addSubview(webView)
        webView.hidden = true
        view.autoresizesSubviews = true
        let url = NSURL(string: "http://live.towchoice.com/provider/")!
        webView.loadRequest(NSURLRequest(URL: url))
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
    
    func webViewDidStartLoad(webView: UIWebView) {
        loadingView.startAnimating()
        loadingView.hidden = false
        NSLog("WebView started to load")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingView.stopAnimating()
        loadingView.hidden = true
        loadingImage.hidden = true
        webView.hidden = false
    }

}

