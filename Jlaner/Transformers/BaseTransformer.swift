//
//  BaseTransformer.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 24/08/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

class BaseTransformer: NSValueTransformer {
    override class func transformedValueClass() -> AnyClass! {
        return NSString.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
}
