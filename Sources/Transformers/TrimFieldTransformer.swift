//
//  TrimFieldTransformer.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct TrimFieldTransformer: FieldTransformer {

    public let characterSet: CharacterSet

    public static let whitespacesAndNewlines = TrimFieldTransformer(characterSet: .whitespacesAndNewlines)

    public init(characterSet: CharacterSet) {
        self.characterSet = characterSet
    }

    public func transform(value: Any?) -> Any? {
        guard let str = value as? String else {
            return nil
        }
        return str.trimmingCharacters(in: self.characterSet)
    }
}
