//
//  AppDelegate.swift
//  ARCSOFT
//
//  Created by Justin Bush on 2016-05-28.
//  Copyright © 2016 Justin Bush. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var mainWindow: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWindow = NSApplication.shared().windows[0] 
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag{
            mainWindow.makeKeyAndOrderFront(nil)
        }
        
        return true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
