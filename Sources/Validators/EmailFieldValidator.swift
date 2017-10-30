//
//  EmailFieldValidator.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct EmailFieldValidator: FieldValidator {

    public static let failureKey: String! = "errors.validator.email"

    public static let shared = EmailFieldValidator()
    private let predicate: NSPredicate

    private init() {
        FieldValidators.Localization.checkFailureKey(validator: EmailFieldValidator.self)
        self.predicate = NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$")
    }

    public func validate(field: FormField, in form: Form) throws {
        guard let str = field.value as? String, str.characters.count > 0 else {
            return // Skip empty field
        }
        guard predicate.evaluate(with: str) else {
            throw FieldValidators.Localization.error(validator: EmailFieldValidator.self)
        }
    }
}
