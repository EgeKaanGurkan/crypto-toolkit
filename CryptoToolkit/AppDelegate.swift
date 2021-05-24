//
//  AppDelegate.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var statusItem: NSStatusItem?
    let popoverView = NSPopover.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        
//        let contentView = ContentView()
//
//        window = NSWindow(
//            contentRect: NSRect(x: 0, y: 0, width: 500, height: 300),
//            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
//            backing: .buffered, defer: false)
//        window.isReleasedWhenClosed = false
//        window.center()
//        window.setFrameAutosaveName("Main Window")
//        window.contentView = NSHostingView(rootView: contentView)
//        window.makeKeyAndOrderFront(nil)

//        if let screen = NSScreen.main {
//            window.setFrame(screen.visibleFrame, display: true, animate: true)
//        }
        
//        window.minSize = CGSize(width: 400, height: 100)
        
        /* Popover */
        
        let popoverContentView = PopoverContentView()
        
        popoverView.contentViewController = NSViewController()
        popoverView.contentViewController?.view = NSHostingView(rootView: popoverContentView)
        popoverView.behavior = .transient
        popoverView.contentSize = CGSize(width: 450, height: 300)
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.title = "Crypto Toolkit"
        statusItem?.button?.action = #selector(togglePopover(_:))
        
//        let d = DownloadData()
//        d.downloadJSON()
        
    }
    
    @objc func showPopover(_ sender: AnyObject?) {
        if let button = statusItem?.button {
            popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
//            !!! - displays the popover window with an offset in x in macOS BigSur.
        }
    }
    @objc func closePopover(_ sender: AnyObject?) {
        popoverView.performClose(sender)
    }
    @objc func togglePopover(_ sender: AnyObject?) {
        if popoverView.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

