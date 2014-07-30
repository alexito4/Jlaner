//
//  AppDelegate.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 25/07/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!

    @IBOutlet var origin: NSTextView!
    @IBOutlet var destination: NSTextView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication!) -> Bool  {
        return true
    }

    @IBAction func generate(sender: AnyObject) {
        
        let converter = Converter(text: origin.string)
        
        destination.string = converter.convertToObjectiveC()
    }
}

