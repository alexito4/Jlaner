//
//  ObjcTransformer.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 24/08/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

@objc(ObjcTransformer) class ObjcTransformer : BaseTransformer {
            
    override func conversionForArrays() -> ConvertToCharacters {
        return ("@[", "]")
    }
    
    override func conversionForObjects() -> ConvertToCharacters {
        return ("@{", "}")
    }
    
    override func conversionForStrings() -> ConvertToCharacter {
        return " @\""
    }
    
    override func conversionForFalse() -> ConvertToCharacter {
        return " @NO"
    }
    
    override func conversionForTrue() -> ConvertToCharacter {
        return " @YES"
    }
    
    override func conversionForNull() -> ConvertToCharacter {
        return " [NSNull null]"
    }
    
    override func conversionForNumbers() -> ConvertToTemplate {
        return " @($1),"
    }

}