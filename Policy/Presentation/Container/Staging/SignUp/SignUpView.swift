//
//  SignUpController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class SignUpController: UIViewController, SignUpViewController {
    
    var presenter: SignUpPresentable?

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
}


extension SignUpController {
    @IBAction func saveLoginTapped(_ sender: UIButton) {
        presenter?.saveLoginInformation()
    }
    
    @IBAction func appleButtonTapped(_ sender: UIButton) {
        presenter?.signUpWithApple({ [weak self] sender in
            self?.unwrapSignUpResponse(sender) })
    }
    
    @IBAction func googleButtonTapped(_ sender: UIButton) {
        presenter?.signUpWithGoogle({ [weak self] sender in
            self?.unwrapSignUpResponse(sender) })
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        presenter?.signUp(withEmail: emailField.text, password: passwordField.text,
                          confirmation: confirmField.text, { [weak self] sender in
                          self?.unwrapSignUpResponse(sender) })
    }
}





extension SignUpController {
    private func unwrapSignUpResponse(_ response: Any?) {
        guard let response = response else { signUpErrorThrown(response); return }
        presenter?.pushController(withData: response)
    }
    
    private func signUpErrorThrown(_ error: Any?) {
        print("Throw an Error here")
    }
}



//
//
//extension SignUpController {
//    private func validateTextFields() -> SignInModel? {
//        do {
//            let email = try emailField.validateText(for: .email)
//            let password = try passwordField.validateText(for: .password)
//            return SignInModel(email: email, password: password)
//
//        } catch let error as ValidationError { throwError(error.message, for: error.type) } catch { return nil }
//        return nil
//    }
//}
//
//
//
//
//
//
//
//extension SignUpController {
//    func validator(_ textfield: UITextField, for validatorType: ValidatorType, _ completion: @escaping ((String?) -> Void)) {
//        do {
//            let text = try textfield.validateText(for: validatorType); completion(text) }
//            catch let error as ValidationError { throwError(error.message, for: error.type) } catch { }
//    }
//
//    func throwError(_ message: String, for validationType: ValidatorType) {
//        switch validationType {
//        case .email: showError(emailErrorLabel, with: message)
//        case .password: showError(passwordErrorLabel, with: message)
//        default: break }
//    }
//
//    func showError(_ label: UILabel, with message: String) {
//        guard label.isHidden else { shake(label); return }
//        label.text = message
//        label.isHidden = false
//    }
//}
//
//
//
//    @IBAction func emailFieldDidChange(_ sender: UITextField) {
//validator(emailField, for: .email) { [weak self] response in
//    guard response != nil else { return }
//    self?.emailErrorLabel.isHidden = true
//}
//}
//
//@IBAction func passwordFieldDidChange(_ sender: UITextField) {
//validator(passwordField, for: .password) { [weak self] response in
//    guard response != nil else { return }
//    self?.passwordErrorLabel.isHidden = true
//}
//}
//
//
//
//
//
//
//
//
//
