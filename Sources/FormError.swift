//
//  FormError.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct FormError: LocalizedError {

    public let field: FormField
    public let error: Error

    init(field: FormField, error: Error) {
        self.field = field
        self.error = error
    }

    public var errorDescription: String? {
        guard let localized = self.error as? LocalizedError,
            let errorDescription = localized.errorDescription else {
            return self.field.name
        }
        var msg = ""
        if let name = self.field.name {
            msg = "\(name): "
        }
        msg += errorDescription
        return msg
    }
}
