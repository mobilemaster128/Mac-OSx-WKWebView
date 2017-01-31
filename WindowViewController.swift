//
//  WindowViewController.swift
//  ARCSOFT
//
//  Created by Justin Bush on 2016-05-28.
//  Copyright © 2016 Justin Bush. All rights reserved.
//

import Cocoa

class WindowViewController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window!.titlebarAppearsTransparent = true
        window!.isMovableByWindowBackground  = true
        window!.title = ""
        window!.backgroundColor = NSColor(red:0.11, green:0.16, blue:0.20, alpha:1.0)
    }

}
