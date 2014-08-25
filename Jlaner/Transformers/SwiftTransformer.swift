//
//  SwiftTransformer.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 24/08/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

@objc(SwiftTransformer) class SwiftTransformer: BaseTransformer {
    override func transformedValue(value: AnyObject!) -> AnyObject! {
        if value == nil {
            return nil
        }
        
        var result: String = value as String
        
        result += ":D"
        
        return result
    }
}
