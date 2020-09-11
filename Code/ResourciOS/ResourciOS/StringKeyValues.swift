//
//  StringKeyValues.swift
//  ResourciOS
//
//  Created by Jorge Morán on 03/09/2020.
//  Copyright © 2020 Jorge Morán. All rights reserved.
//

import Foundation

class StringKeyValues {
    let key: String
    var values: Array<String>
    
    init(key: String, value: String) {
        self.key = key
        self.values = [value]
    }
}

extension Array where Element : StringKeyValues {
    mutating func append(key: String, value: String) {
        if let skv = self.first(where: { $0.key == key}) {
            skv.values.append(value)
        } else if let element = StringKeyValues(key: key, value: value) as? Element {
            self.append(element)
        }
    }
}
