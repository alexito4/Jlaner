//
//  SwiftTransformer.swift
//  Jlaner
//
//  Created by Alejandro Martinez on 24/08/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Cocoa

@objc(SwiftTransformer) class SwiftTransformer: BaseTransformer {
    
    override func conversionForArrays() -> ConvertToCharacters {
        return ("[", "]")
    }
    
    override func conversionForObjects() -> ConvertToCharacters {
        return ("[", "]")
    }
    
    override func conversionForStrings() -> ConvertToCharacter {
        return " \""
    }
    
    override func conversionForFalse() -> ConvertToCharacter {
        return " false"
    }
    
    override func conversionForTrue() -> ConvertToCharacter {
        return " true"
    }
    
    override func conversionForNull() -> ConvertToCharacter {
        return " nil"
    }
    
    override func conversionForNumbers() -> ConvertToTemplate {
        return " $1,"
    }
}
