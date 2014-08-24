//
//  ObjcTransformer.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 24/08/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

@objc(ObjcTransformer) class ObjcTransformer : BaseTransformer {
        
    override func transformedValue(value: AnyObject!) -> AnyObject! {        
        if value == nil {
            return nil
        }
        
        var result: String = value as String
        
        var error: NSError?
        let json: AnyObject! = NSJSONSerialization.JSONObjectWithData(result.dataUsingEncoding(NSUTF8StringEncoding), options:NSJSONReadingOptions.MutableContainers, error: &error)
        if !json {
            println("Error parsing JSON")
            return nil
        }
        
        result = result.stringByReplacingOccurrencesOfString("[", withString: "@[", options: nil, range: nil) // arrays
        result = result.stringByReplacingOccurrencesOfString("{", withString: "@{", options: nil, range: nil) // objects
        result = result.stringByReplacingOccurrencesOfString(" \"", withString: " @\"", options: nil, range: nil) // strings
        result = result.stringByReplacingOccurrencesOfString(" false", withString: " @NO", options: nil, range: nil) // bool
        result = result.stringByReplacingOccurrencesOfString(" true", withString: " @YES", options: nil, range: nil) // bool
        result = result.stringByReplacingOccurrencesOfString(" null", withString: " [NSNull null]", options: nil, range: nil) // nulls
        
        // numbers
        let lenght = result.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        let all = NSRange(location: 0, length: lenght)
        let pattern = "[\\s]([-]?[0-9]*\\.?[0-9]*)[,]"
        let exp = NSRegularExpression(pattern: pattern, options: nil, error: nil)
        result = exp.stringByReplacingMatchesInString(result, options: nil, range: NSMakeRange(0, result.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)), withTemplate: " @($1),")
        
        return result
    }
    
}