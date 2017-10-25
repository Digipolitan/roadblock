//
//  FormTextFieldDelegateChainable.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

public class FormTextFieldDelegateChainable: NSObject, UITextFieldDelegate {

    public weak private(set) var form: Form?

    public init(form: Form) {
        self.form = form
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard let form = self.form,
            let idx = form.index(of: textField) else {
            return
        }
        form[idx].value = textField.text
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let form = self.form,
            let idx = form.index(of: textField) else {
            return true
        }
        textField.resignFirstResponder()
        form[idx].nextField()
        return true
    }
}
