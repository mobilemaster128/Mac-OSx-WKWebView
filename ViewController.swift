//
//  ViewController.swift
//  ARCSOFT
//
//  Created by Justin Bush on 2016-05-28.
//  Copyright © 2016 Justin Bush. All rights reserved.
//

import Cocoa
import WebKit
import Foundation

let secureURL = "http://app.arcsoft.io"

class ViewController: NSViewController, WebFrameLoadDelegate {
    
    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var windowTitle: NSTextField!
    @IBOutlet weak var networkError: NSImageView!
    @IBOutlet weak var retryButton: NSButton!
    
    @IBAction func attemptReload(_ sender: NSButton) {
        self.webView.mainFrame.load(URLRequest(url: URL(string: secureURL)!))
    }

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial WebView Setup
        webView.layerUsesCoreImageFilters = true
        WebPreferences.standard().allowsAirPlayForMediaPlayback = true
        
        // Client Identifier
        let userAgent = "ARCSOFT Client v1.0"
        webView.customUserAgent = userAgent
        defaults.register(defaults: ["UserAgent": userAgent])
        defaults.register(defaults: ["User-Agent": userAgent])

        // Launch Secure Client
        self.webView.mainFrame.load(URLRequest(url: URL(string: secureURL)!))
        
        // Hide Network Error on Launch
        retryButton.isHidden = true
        networkError.isHidden = true
    }
    
    func webView(_ sender: WebView!, didReceiveTitle title: String!, for frame: WebFrame!) {
        windowTitle.stringValue = "ARCSOFT™ – Web Builder & Design"
    }
    
    func webView(_ sender: WebView!, didFinishLoadFor frame: WebFrame!) {
        print("Load Successful")
        retryButton.isHidden = true
        networkError.isHidden = true
    }
    
    func webView(_ sender: WebView!, didStartProvisionalLoadFor frame: WebFrame!) {
        retryButton.isHidden = true
        networkError.isHidden = true
    }
    
    func webView(_ sender: WebView!, didFailProvisionalLoadWithError error: Error!, for frame: WebFrame!) {
        print("Failed to Load Client")
        // Present user with error.
        retryButton.isHidden = false
        networkError.isHidden = false
        networkError.layer?.backgroundColor = NSColor(red:0.11, green:0.16, blue:0.20, alpha:1.0).cgColor
        
    }
    
    func webView(_ sender: WebView!, runOpenPanelForFileButtonWithResultListener resultListener: WebOpenPanelResultListener!, allowMultipleFiles: Bool) {
        let openDialog = NSOpenPanel()
        if (openDialog.runModal() == NSModalResponseOK) {
            let fileName: String = (openDialog.url?.path)!
            resultListener.chooseFilename(fileName) // Use chooseFilenames for multiple files
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
