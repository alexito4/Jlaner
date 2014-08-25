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
    
    // Bindings
    @IBOutlet var original: NSTextView!
    @IBOutlet var destination: NSTextView!
    var bindableText: NSString?
    
    // Transformables
    @IBOutlet weak var languagePopup: NSPopUpButton!
    
    struct TransformableInfo {
        let display: String
        let name: String
    }
    
    private let transformables = [
        TransformableInfo(display: "Objective-C", name: "ObjcTransformer"),
        TransformableInfo(display: "Swift", name: "SwiftTransformer")
    ]
        
    override func awakeFromNib() {
        for transformable in transformables {
            languagePopup.addItemWithTitle(transformable.display)
        }
    }
    
    @IBAction func changed(sender: NSPopUpButton) {
        let selected = transformables[sender.indexOfSelectedItem]
        bindDestinationWithTransformable(selected.name)
    }
}

extension ConverterManager {
    func bindDestinationWithTransformable(transformableName : String) {
        destination.bind("value", toObject: self, withKeyPath: "bindableText", options: [
            NSAllowsEditingMultipleValuesSelectionBindingOption : true,
            NSAlwaysPresentsApplicationModalAlertsBindingOption : false,
            NSConditionallySetsEditableBindingOption : true,
            NSConditionallySetsHiddenBindingOption : false,
            NSContinuouslyUpdatesValueBindingOption : true,
            NSRaisesForNotApplicableKeysBindingOption :  true,
            NSValidatesImmediatelyBindingOption : false,
            NSValueTransformerNameBindingOption : transformableName
        ])
    }
}

