//
//  Form.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

public protocol FormDelegate: class {
    func formDidSubmit(_ form: Form)
    func form(_ form: Form, field: FormField, valueDidChange value: Any?)
    func form(_ form: Form, fieldDidChange field: FormField)
}

public class Form {

    public fileprivate(set) var fields: [FormField]
    // swiftlint:disable weak_delegate
    public weak var delegate: FormDelegate?
    // swiftlint:enable weak_delegate

    public init(fields: [FormField], delegate: FormDelegate? = nil) {
        self.fields = fields
        self.delegate = delegate
        for field in self.fields {
            field.form = self
        }
    }
}

public class FormField {

    public let identifier: String
    public let target: UIResponder
    public let validator: FieldValidator?
    public let transformer: FieldTransformer?
    public let name: String?
    public var value: Any? {
        get {
            return self.data
        }
        set {
            if let transformer = self.transformer {
                self.data = transformer.transform(value: newValue)
            } else {
                self.data = newValue
            }
        }
    }
    private var data: Any? = nil {
        didSet {
            guard let form = self.form else {
                return
            }
            form.delegate?.form(form, field: self, valueDidChange: self.data)
        }
    }
    public fileprivate(set) weak var form: Form?

    public init(identifier: String,
                target: UIResponder,
                name: String? = nil,
                validator: FieldValidator? = nil,
                transformer: FieldTransformer? = nil,
                value: Any? = nil) {
        self.identifier = identifier
        self.target = target
        self.name = name
        self.validator = validator
        self.transformer = transformer
        self.value = value
    }

    @discardableResult
    public func nextField() -> Bool {
        guard let form = self.form else {
            return false
        }
        if var idx = form.index(of: self.target) {
            idx += 1
            if idx < form.countFields() {
                form.delegate?.form(form, fieldDidChange: form[idx])
                return true
            } else {
                form.delegate?.formDidSubmit(form)
            }
        }
        return false
    }
}

extension Form {

    public func index(of target: UIResponder) -> Int? {
        return self.fields.index(where: { $0.target == target })
    }

    public subscript(index: Int) -> FormField {
        get {
            return self.fields[index]
        }
    }

    public subscript(identifier: String) -> FormField? {
        get {
            return self.fields.first { $0.identifier == identifier }
        }
    }

    public func countFields() -> Int {
        return self.fields.count
    }

    public func validate() throws {
        for field in self.fields {
            do {
                try field.validator?.validate(field: field, in: self)
            } catch {
                throw FormError(field: field, error: error)
            }
        }
    }
}

extension FormDelegate {
    public func formDidSubmit(_ form: Form) {}
    public func form(_ form: Form, field: FormField, valueDidChange value: Any?) { }
    public func form(_ form: Form, fieldDidChange field: FormField) {
        field.target.becomeFirstResponder()
    }
}
