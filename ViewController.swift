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

let secureURL = "https://www.arcsoft.io/secure/"

class ViewController: NSViewController {
    
    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var windowTitle: NSTextField!
    @IBOutlet weak var networkError: NSImageView!
    @IBOutlet weak var retryButton: NSButton!
    
    @IBAction func attemptReload(sender: NSButton) {
        self.webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: secureURL)!))
    }

    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial WebView Setup
        webView.layerUsesCoreImageFilters = true
        WebPreferences.standardPreferences().allowsAirPlayForMediaPlayback = true
        
        // Client Identifier
        let userAgent = "ARCSOFT Client v1.0"
        webView.customUserAgent = userAgent
        defaults.registerDefaults(["UserAgent": userAgent])
        defaults.registerDefaults(["User-Agent": userAgent])

        // Launch Secure Client
        self.webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: secureURL)!))
        
        // Hide Network Error on Launch
        retryButton.hidden = true
        networkError.hidden = true
    }
    
    func webView(sender: WebView!, didReceiveTitle title: String!, forFrame frame: WebFrame!) {
        windowTitle.stringValue = "ARCSOFT Studio"
    }
    
    func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        print("Load Successful")
        retryButton.hidden = true
        networkError.hidden = true
    }
    
    func webView(sender: WebView!, didStartProvisionalLoadForFrame frame: WebFrame!) {
        retryButton.hidden = true
        networkError.hidden = true
    }
    
    func webView(sender: WebView!, didFailProvisionalLoadWithError error: NSError!, forFrame frame: WebFrame!) {
        print("Failed to Load Client")
        // Present user with error.
        retryButton.hidden = false
        networkError.hidden = false
        networkError.layer?.backgroundColor = NSColor(red:0.145, green:0.145, blue:0.157, alpha:1.0).CGColor
    }
    
    func webView(sender: WebView!, runOpenPanelForFileButtonWithResultListener resultListener: WebOpenPanelResultListener!, allowMultipleFiles: Bool) {
        let openDialog = NSOpenPanel()
        if (openDialog.runModal() == NSModalResponseOK) {
            let fileName: String = (openDialog.URL?.path)!
            resultListener.chooseFilename(fileName) // Use chooseFilenames for multiple files
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
