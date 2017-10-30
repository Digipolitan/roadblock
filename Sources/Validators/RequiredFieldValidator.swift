//
//  RequiredFieldValidator.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct RequiredFieldValidator: FieldValidator {

    public static let shared = RequiredFieldValidator()

    public static let failureKey: String! = "errors.validator.required"

    private init() {
       FieldValidators.Localization.checkFailureKey(validator: RequiredFieldValidator.self)
    }

    public func validate(field: FormField, in form: Form) throws {
        guard field.value != nil else {
            throw FieldValidators.Localization.error(validator: RequiredFieldValidator.self)
        }
    }
}
