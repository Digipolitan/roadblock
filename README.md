Roadblock
=================================

[![Build Status](https://travis-ci.org/Digipolitan/roadblock.svg?branch=master)](https://travis-ci.org/Digipolitan/roadblock)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Roadblock.svg)](https://img.shields.io/cocoapods/v/Roadblock.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/Roadblock.svg?style=flat)](http://cocoadocs.org/docsets/Roadblock)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

Roadblock, a simple way to check forms verifications.

## Installation

### CocoaPods

To install Roadblock with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0' # or platform :osx, '10.10' if your target is OS X.
use_frameworks!

pod 'Roadblock'
```

## The Basics

First to catch errors you need to add the following keys to your **Localizable.string** file

```strings
"errors.validator.required" = "Missing required field";
"errors.validator.email" = "Invalid email";
"errors.validator.min_length_%d" = "Minimum %1$d characters";
"errors.validator.max_length_%d" = "Maximum de %1$d characters";
```

After that, you need to implement the `FormDelegate` protocol

```swift
extension ViewController: FormDelegate {

    func formDidSubmit(_ form: Form) {
        self.validateButtonClicked()
    }
}
```

Then you can register the form on your `viewDidLoad()` method like following

```swift
@IBOutlet weak var emailTextField: UITextField!
@IBOutlet weak var passwordTextField: UITextField!
public var form: Form!
private var formTextFieldChainable: FormTextFieldDelegateChainable?

override func viewDidLoad() {
    super.viewDidLoad()

       self.form = Form(fields: [
           .init(identifier: Fields.email,
                 target: self.emailTextField,
                 name: "email",
                 validator: FieldValidators.group(FieldValidators.required(), FieldValidators.email()),
                 transformer: FieldTransformers.group(FieldTransformers.trim(), FieldTransformers.emptyIsNil())),
           .init(identifier: Fields.password,
                 target: self.passwordTextField,
                 name: "password",
                 validator: FieldValidators.group(FieldValidators.required()),
                 transformer: FieldTransformers.group(FieldTransformers.trim(), FieldTransformers.emptyIsNil()))
           ], delegate: self)

       let formTextFieldChainable = FormTextFieldDelegateChainable(form: self.form)
       self.emailTextField.delegate = formTextFieldChainable
       self.passwordTextField.delegate = formTextFieldChainable
       self.formTextFieldChainable = formTextFieldChainable
   }
}
```

Then you can handle the forms erros on youre `@IBAction` function

```swift
@IBAction func validateButtonClicked() {
    self.view.endEditing(true)
    do {
        try self.form.validate()
    } catch {
        if let err = error as? FormError {
            let alertController = UIAlertController(title: "Error", message:
                    err.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss",style: UIAlertActionStyle.default, handler: nil))

            self.present(alertController, animated: true, completion: nil)
        }
    }
    return
}
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

Roadblock is licensed under the [BSD 3-Clause license](LICENSE).
