//
//  BaseTransformer.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 24/08/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

typealias ConvertToCharacters = (start: String, end: String)
typealias ConvertToCharacter = String
typealias ConvertToTemplate = String

protocol JlanerTransformer {
    func conversionForArrays() -> ConvertToCharacters
    func conversionForObjects() -> ConvertToCharacters
    func conversionForStrings() -> ConvertToCharacter
    func conversionForFalse() -> ConvertToCharacter
    func conversionForTrue() -> ConvertToCharacter
    func conversionForNull() -> ConvertToCharacter
    func conversionForNumbers() -> ConvertToTemplate
}

class BaseTransformer: NSValueTransformer, JlanerTransformer {
    override class func transformedValueClass() -> AnyClass! {
        return NSString.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
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
        
        result = result.stringByReplacingOccurrencesOfString("[", withString: conversionForArrays().start, options: nil, range: nil) // arrays
        result = result.stringByReplacingOccurrencesOfString("]", withString: conversionForArrays().end, options: nil, range: nil) // arrays
        
        result = result.stringByReplacingOccurrencesOfString("{", withString: conversionForObjects().start, options: nil, range: nil) // objects
        result = result.stringByReplacingOccurrencesOfString("}", withString: conversionForObjects().end, options: nil, range: nil) // objects
        
        result = result.stringByReplacingOccurrencesOfString(" \"", withString: conversionForStrings(), options: nil, range: nil) // strings
        
        result = result.stringByReplacingOccurrencesOfString(" false", withString: conversionForFalse(), options: nil, range: nil) // bool
        
        result = result.stringByReplacingOccurrencesOfString(" true", withString: conversionForTrue(), options: nil, range: nil) // bool
        
        result = result.stringByReplacingOccurrencesOfString(" null", withString: conversionForNull(), options: nil, range: nil) // nulls
        
        
        // numbers
        let lenght = result.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        let all = NSRange(location: 0, length: lenght)
        let pattern = "[\\s]([-]?[0-9]*\\.?[0-9]*)[,]"
        let exp = NSRegularExpression(pattern: pattern, options: nil, error: nil)
        result = exp.stringByReplacingMatchesInString(result, options: nil, range: NSMakeRange(0, result.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)), withTemplate: conversionForNumbers())
        
        return result
    }
    
    // JlanerTransformer
    // This cannot be in an extension, seems like subclasses can't overwrite extension methods
    func conversionForArrays() -> ConvertToCharacters {
        return ("", "")
    }
    
    func conversionForObjects() -> ConvertToCharacters {
        return ("", "")
    }
    
    func conversionForStrings() -> ConvertToCharacter {
        return ""
    }
    
    func conversionForFalse() -> ConvertToCharacter {
        return ""
    }
    
    func conversionForTrue() -> ConvertToCharacter {
        return ""
    }
    
    func conversionForNull() -> ConvertToCharacter {
        return ""
    }
    
    func conversionForNumbers() -> ConvertToTemplate {
        return ""
    }
}

