//
//  FieldValidator.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public protocol FieldValidator {

    static var failureKey: String! { get }

    func validate(field: FormField, in form: Form) throws
}

public struct FieldValidatorArray: FieldValidator {

    public static var failureKey: String! = nil

    public let validators: [FieldValidator]

    public init(validators: [FieldValidator]) {
        self.validators = validators
    }

    public func validate(field: FormField, in form: Form) throws {
        try self.validators.forEach { try $0.validate(field: field, in: form) }
    }
}
