//
//  TextFieldHelpers.swift
//  Policy
//
//  Created by Bradley Ensign on 6/3/22.
//

import UIKit


extension UITextView {
    func addAccessory(_ title: String = "Cancel") {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        let doneToolbar: UIToolbar = UIToolbar(frame: frame)
        
        doneToolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(cancelButtonAction))
        
        let items = [cancel, flexSpace]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        inputAccessoryView = doneToolbar
    }

    @objc func cancelButtonAction() {
        text = nil
        resignFirstResponder()
    }
}




extension UITextField {
    func addAccessory(_ title: String = "Cancel") {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        let doneToolbar: UIToolbar = UIToolbar(frame: frame)
        
        doneToolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(cancelButtonAction))
        
        let items = [cancel, flexSpace]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        inputAccessoryView = doneToolbar
    }

    @objc func cancelButtonAction() {
        text = nil
        resignFirstResponder()
    }
}


extension UIResponder {

    private static weak var _currentFirstResponder: UIResponder?

    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    @objc func findFirstResponder(_ sender: Any) { UIResponder._currentFirstResponder = self }
}




protocol TextFieldProtocol: UIView {
    associatedtype SomeView where SomeView: UIView
    var textFields: SomeView { get set }
    
    func finishedWithKeyboard()
    func adjustView(_ space: CGFloat)
    func getSpaceToBottom() -> CGFloat
    func viewForCurrentResponder() -> UIView?
    func hidingKeyboard(notification: NSNotification)
    func showingKeyboard(notification: NSNotification)
    func returningTextField(_ textField: UITextField) -> Bool
    func getKeyboardFrame(_ notification: NSNotification) -> CGRect?
}


extension TextFieldProtocol {
    func finishedWithKeyboard() { endEditing(true) }
    
    func hidingKeyboard(notification: NSNotification) { repositionView() }
    
    func repositionView() {
        if frame.origin.y < 0 { adjustView(frame.origin.y) }
    }
    
    func showingKeyboard(notification: NSNotification) {
        repositionView()
        let space = getSpaceToBottom() - 20
        guard let keyboard = getKeyboardFrame(notification)?.size.height else { return }
        guard keyboard < space else { adjustView(keyboard - space); return }
    }
    
    func getKeyboardFrame(_ notification: NSNotification) -> CGRect? {
        guard let note = notification.userInfo else { return nil }
        guard let frame = note[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return nil }
        return convert(frame.cgRectValue, from: nil)
    }
    
    func getSpaceToBottom() -> CGFloat {
        guard let responder = viewForCurrentResponder() else { return frame.maxY} // return 0
        let boundsOffset = textFields.bounds.maxY - responder.frame.maxY
        let offset = textFields.frame.maxY - boundsOffset
        return frame.maxY - offset
    }
    
    func viewForCurrentResponder() -> UIView? {
        for view in textFields.subviews {
            guard view.isFirstResponder, let textView = view as? UITextField else { continue }
            return textView }
        return nil
    }
    
    
    func adjustView(_ space: CGFloat) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.frame.origin.y -= space
            self?.layoutIfNeeded()
        }, completion: nil)
    }

    
    func returningTextField(_ textField: UITextField) -> Bool {
        guard let field = textFields.viewWithTag(textField.tag + 1) as? UITextField else {
            textField.resignFirstResponder()
            return false
        }
        DispatchQueue.main.async { field.becomeFirstResponder() }
        return false
    }
}


