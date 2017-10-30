//
//  LengthFieldValidator.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct MinLengthFieldValidator: FieldValidator {

    public static let failureKey: String! = "errors.validator.min_length"

    private let length: Int

    public init(length: Int) {
        FieldValidators.Localization.checkFailureKey(validator: MinLengthFieldValidator.self)
        self.length = length
    }

    public func validate(field: FormField, in form: Form) throws {
        guard let str = field.value as? String, str.characters.count > 0 else {
            return // Skip empty field
        }
        guard str.characters.count >= self.length else {
            throw FieldValidators.Localization.error(validator: MinLengthFieldValidator.self, arguments: self.length)
        }
    }
}

public struct MaxLengthFieldValidator: FieldValidator {

    public static let failureKey: String! = "errors.validator.max_length"

    private let length: Int

    public init(length: Int) {
        FieldValidators.Localization.checkFailureKey(validator: MaxLengthFieldValidator.self)
        self.length = length
    }

    public func validate(field: FormField, in form: Form) throws {
        guard let str = field.value as? String, str.characters.count > 0 else {
            return // Skip empty field
        }
        guard str.characters.count <= self.length else {
            throw FieldValidators.Localization.error(validator: MaxLengthFieldValidator.self, arguments: self.length)
        }
    }
}
