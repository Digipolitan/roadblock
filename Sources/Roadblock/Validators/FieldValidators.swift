//
//  FieldValidators.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation
import LocalizationToolkit

public class FieldValidators {

    public class Localization {
        public static var bundle: Bundle = .main
        public static var table: String?

        public static func error(validator: FieldValidator.Type) -> ValidatorError {
            return ValidatorError(message: validator.failureKey.localized(bundle: Localization.bundle, table: Localization.table))
        }

        public static func error(validator: FieldValidator.Type, arguments: CVarArg...) -> ValidatorError {
            return ValidatorError(message: validator.failureKey.localized(bundle: Localization.bundle, table: Localization.table, arguments: arguments))
        }

        public static func checkFailureKey(validator: FieldValidator.Type) {
            if let failureKey = validator.failureKey,
                failureKey.localized(bundle: Localization.bundle, table: Localization.table, value: nil) == failureKey {
                fatalError("Missing '\(failureKey)' in your \(Localization.table ?? "Localizable").string")
            }
        }
    }

    private init() { }

    public class func email() -> FieldValidator {
        return EmailFieldValidator.shared
    }

    public class func min(length: Int = 0) -> FieldValidator {
        return MinLengthFieldValidator(length: length)
    }

    public class func max(length: Int = 0) -> FieldValidator {
        return MaxLengthFieldValidator(length: length)
    }

    public class func required() -> FieldValidator {
        return RequiredFieldValidator.shared
    }

    public class func group(_ validators: FieldValidator...) -> FieldValidator {
        return FieldValidatorArray(validators: validators)
    }
}
