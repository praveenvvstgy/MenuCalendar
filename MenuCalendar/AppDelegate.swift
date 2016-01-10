//
//  AppDelegate.swift
//  MenuCalendar
//
//  Created by Praveen Gowda I V on 1/10/16.
//  Copyright © 2016 Praveen Gowda I V. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, MLCalendarViewDelegate {

    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    
    let popover = NSPopover()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        if let button = statusItem.button {
            button.image = NSImage(named: "calendar")
            button.action = Selector("toggleCalendar:")
        }
        
        let calendar = MLCalendarView()
        calendar.delegate = self
        calendar.date  = NSDate()
        
        popover.contentViewController = calendar
        popover.appearance = NSAppearance(named: NSAppearanceNameAqua)
    }
    
    func toggleCalendar(sender: NSStatusBarButton) {
        if popover.shown {
            hideCalendar(sender)
        } else {
            showCalendar(sender)
        }
    }
    
    func showCalendar(sender: AnyObject) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: .MinY)
        }
    }
    
    func hideCalendar(sender: AnyObject) {
        popover.performClose(sender)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func didSelectDate(selectedDate: NSDate!) {
//        print(selectedDate)
    }


}

