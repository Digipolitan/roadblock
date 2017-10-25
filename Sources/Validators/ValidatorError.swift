//
//  ValidatorError.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct ValidatorError: LocalizedError {

    public private(set) var message: String

    public init(message: String) {
        self.message = message
    }

    public var errorDescription: String? {
        return message
    }
}
