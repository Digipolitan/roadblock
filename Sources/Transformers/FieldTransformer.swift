//
//  FieldTransformer.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public protocol FieldTransformer {
    func transform(value: Any?) -> Any?
}

public struct FieldTransformerArray: FieldTransformer {

    public let transformers: [FieldTransformer]

    public init(transformers: [FieldTransformer]) {
        self.transformers = transformers
    }

    public func transform(value: Any?) -> Any? {
        var res: Any? = value
        for transformer in self.transformers {
            res = transformer.transform(value: res)
        }
        return res
    }
}
