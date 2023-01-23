//
//  SignUpInteractor.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//


class SignUpInteractor: SignUpInteractable {
    var presenter: SignUpPresentable?

    func saveLoginInformation() {
    }
    
    func signUpWithApple(_ completion: @escaping ((Any?) -> Void)) {
        completion(true)
    }
    
    func signUpWithGoogle(_ completion: @escaping ((Any?) -> Void)) {
        completion(true)
    }
    
    func signUp(withEmail email: String?, password pass: String?, confirmation confirm: String?,
                                                                _ completion: @escaping ((Any?) -> Void)) {
        completion(true)
    }
}


// Helper functions
extension SignUpInteractor {
    func validateText(_ text: String?) -> String? {
        return "true"
    }
}
