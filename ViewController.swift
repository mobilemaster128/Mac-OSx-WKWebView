//
//  ViewController.swift
//  ARCSOFT
//
//  Created by Sierra on 3/1/17.
//  Copyright © 2017 Justin Bush. All rights reserved.
//

import Cocoa
import WebKit

let secureURL = "http://app.arcsoft.io"

class ViewController: NSViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var containerView: NSView!
    @IBOutlet weak var progressView: NSProgressIndicator!
    @IBOutlet weak var urlTextField: NSTextField!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: self.containerView.bounds, configuration: webConfiguration)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.load(URLRequest(url: URL(string: secureURL)!))
        
        webView.autoresizingMask.insert(NSAutoresizingMaskOptions(rawValue: NSAutoresizingMaskOptions.viewWidthSizable.rawValue | NSAutoresizingMaskOptions.viewHeightSizable.rawValue))
        containerView.addSubview(webView)
        
        urlTextField.stringValue = secureURL
        
        progressView.startAnimation(nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {//"estimatedProgress" {
            progressView.alphaValue = 1.0
            progressView.doubleValue = self.webView.estimatedProgress * 100
            
            if self.webView.estimatedProgress >= 1.0 {
                progressView.alphaValue = 0.0
                progressView.doubleValue = 0.0
            }
        }
    }
    
}
