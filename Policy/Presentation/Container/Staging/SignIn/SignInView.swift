//
//  SignInController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class SignInController: UIViewController, SignInViewController, ActivityIndicatorDelegate {
    
    var presenter: SignInPresentable?

    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var blurView: BlurView!
    @IBOutlet weak var activityView: ActivityView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
}


// Handlinf Button Taps
extension SignInController {
    @IBAction func saveLoginTapped(_ sender: UIButton) {
        presenter?.saveLoginInformation()
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        presenter?.pushSignUpController(withData: nil)
    }

    @IBAction func appleTapped(_ sender: UIButton) {
        presenter?.signInWithApple({ [weak self] sender in
            self?.unwrapSignInResponse(sender) })
    }
    
    @IBAction func googleTapped(_ sender: UIButton) {
        presenter?.signInWithGoogle({ [weak self] sender in
            self?.unwrapSignInResponse(sender) })
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        guard let signIn = validateTextFields() else { return }
        
        showActivityIndicator()
        presenter?.signIn(withEmail: signIn.email, andPassword: signIn.password, { [weak self] sender in
            self?.unwrapSignInResponse(sender)
        })
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        presenter?.forgotPassword(for: emailField.text, { [weak self] sender in
            guard let sender = sender else { self?.signInErrorThrown(sender); return }
            print("Tell user email link was sent to their email \(sender)")
        })
    }
}



// Handling SignIn Responses
extension SignInController {
    private func unwrapSignInResponse(_ response: Any?) {
        hideActivityIndicator()
        
        guard let response = response else { signInErrorThrown(response); return }
        successfullySignedIn(response)
    }
    
    private func signInErrorThrown(_ error: Any?) {
        guard let _ = error else { return }
        showMessagePrompt("some Message in the error")
    }
    
    private func successfullySignedIn(_ response: Any?) {
        presenter?.pushHomeController(withData: response)
    }
}





// Handling Validations
extension SignInController {
    private func validateTextFields() -> SignInModel? {
        do {
            let email = try emailField.validateText(for: .email)
            let password = try passwordField.validateText(for: .password)
            return SignInModel(email: email, password: password)
            
        } catch let error as ValidationError { throwError(error.message, for: error.type) } catch { return nil }
        return nil
    }
    
    func throwError(_ message: String, for validationType: ValidatorType) {
        switch validationType {
        case .email: showError(emailErrorLabel, with: message)
        case .password: showError(passwordErrorLabel, with: message)
        default: break }
    }

    func showError(_ label: UILabel, with message: String) {
//        guard label.isHidden else { shake(label); return } Non issue. Xcode just blows
//        label.text = message
//        label.isHidden = false
    }
}




