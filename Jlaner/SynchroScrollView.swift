//
//  SynchroScrollView.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 26/07/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

class SynchroScrollView : NSScrollView {
    
    @IBOutlet private var synchronizedScrollView: NSScrollView? {
    willSet {
        stopSyncrhonizing()
    }
    didSet {
        let synchronizedContentView = synchronizedScrollView!.contentView
        synchronizedContentView.postsBoundsChangedNotifications = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "synchronizedViewContentBoundsDidChange:", name: NSViewBoundsDidChangeNotification, object: synchronizedContentView)
    }
    }
    
    func stopSyncrhonizing() {
        if let s = synchronizedScrollView? {
            let synchronizedContentView = s.contentView
            
            NSNotificationCenter.defaultCenter().removeObserver(self, name:NSViewBoundsDidChangeNotification, object:s)
            
            synchronizedScrollView = nil
        }
    }

    func synchronizedViewContentBoundsDidChange(notification: NSNotification) {
        let changedContentView: AnyObject! = notification.object
        let changedBoundsOrigin = changedContentView.documentVisibleRect.origin
        
        let curOffset = contentView.bounds.origin
        var newOffset = curOffset
        
        newOffset.y = changedBoundsOrigin.y
        
        if !NSEqualPoints(curOffset, changedBoundsOrigin) {
            contentView.scrollPoint(newOffset)
            reflectScrolledClipView(contentView)
        }
    }
}