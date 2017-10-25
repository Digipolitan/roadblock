//
//  EmptyIsNilFieldTransformer.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct EmptyIsNilFieldTransformer: FieldTransformer {

    public static let shared = EmptyIsNilFieldTransformer()

    private init() { }

    public func transform(value: Any?) -> Any? {
        guard let str = value as? String, str.count > 0 else {
            return nil
        }
        return str
    }
}
