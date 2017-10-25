//
//  String+Localization.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

extension String {

    public func localized(bundle: Bundle = .main, table: String? = nil, value: String? = nil) -> String {
        return bundle.localizedString(forKey: self, value: value, table: table)
    }

    public func localized(bundle: Bundle = .main, table: String? = nil, value: String? = nil, arguments: CVarArg...) -> String {
        return self.localized(bundle: bundle, table: table, value: value, arguments: arguments)
    }

    public func localized(bundle: Bundle = .main, table: String? = nil, value: String? = nil, arguments: [CVarArg]) -> String {
        return String(format: bundle.localizedString(forKey: self, value: value, table: table), arguments: arguments)
    }
}
