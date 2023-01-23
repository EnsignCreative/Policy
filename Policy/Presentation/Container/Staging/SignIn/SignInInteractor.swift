//
//  SignInInteractor.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

class SignInInteractor: SignInInteractable {
    var presenter: SignInPresentable?

    
    func saveLoginInformation() {

    }
    
    func signInWithApple(_ completion: @escaping ((Any?) -> Void)) {
        completion(true)
    }
    
    func signInWithGoogle(_ completion: @escaping ((Any?) -> Void)) {
        completion(true)
    }
    
    func forgotPassword(for email: String?, _ completion: @escaping ((Any?) -> Void)) {
        completion(true)
    }
    
    func signIn(withEmail email: String?, andPassword password: String?, _ completion: @escaping ((Any?) -> Void)) {
        completion(true)
    }
}


// Helper functions
extension SignInInteractor {
    func isUserSignedIn() -> Bool {
        return true
    }
}
