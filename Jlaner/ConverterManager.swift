//
//  ConverterManager.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 24/08/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Foundation
import AppKit

class ConverterManager : NSObject {
    
    @IBOutlet var original: NSTextView!
    @IBOutlet var destination: NSTextView!
    
    var bindableText: NSString?
}