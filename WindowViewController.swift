//
//  WindowViewController.swift
//  ARCSOFT
//
//  Created by Sierra on 3/1/17.
//  Copyright © 2017 Justin Bush. All rights reserved.
//

import Cocoa

class WindowViewController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window!.titlebarAppearsTransparent = true
        window!.isMovableByWindowBackground  = true
        window!.title = ""
        window!.backgroundColor = NSColor(red:0.11, green:0.16, blue:0.20, alpha:1.0)
    }

}
