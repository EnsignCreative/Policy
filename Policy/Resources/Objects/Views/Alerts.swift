//
//  Alerts.swift
//  Policy
//
//  Created by Bradley Ensign on 6/3/22.
//


import UIKit

struct AlertAction {
    
    var alertController = UIAlertController()
    
    init(_ alert: AlertModel, withCancel hasCancel: Bool) {
        let controller = UIAlertController(title: alert.title, message: alert.message, preferredStyle: alert.style)
        
        controller.addAction(addProceed(alert.proceed))
        if hasCancel { controller.addAction(addCancel()) }

        alertController = controller
    }
    
    private func addCancel() -> UIAlertAction {
        return UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
    }
    
    private func addProceed(_ action: AlertActionModel)  -> UIAlertAction {
        return UIAlertAction(title: action.title, style: action.style, handler: action.handler)
    }
}



private class SaveAlertHandle {
    static var alertHandle: UIAlertController?
    
    class func clear() { alertHandle = nil }
    class func get() -> UIAlertController? { return alertHandle }
    class func set(_ handle: UIAlertController) { alertHandle = handle }
}

extension UIViewController {
    func showSpinner(_ completion: (() -> Void)?) {
        let alertController = UIAlertController(title: nil, message: "Please Wait...\n\n\n\n", preferredStyle: .alert)
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = UIColor(ciColor: .black)
        spinner.center = CGPoint(x: alertController.view.frame.midX,
                                 y: alertController.view.frame.midY)
        spinner.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin,
                                    .flexibleLeftMargin, .flexibleRightMargin]
        spinner.startAnimating()
        alertController.view.addSubview(spinner)
        present(alertController, animated: true, completion: completion)
    }

    func hideSpinner(_ completion: (() -> Void)?) {
        guard let controller = SaveAlertHandle.get() else { return }
        SaveAlertHandle.clear()
        controller.dismiss(animated: true, completion: completion)
    }
}

extension UIViewController {

    func showMessagePrompt(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
    
    func showMessagePrompt(withTitle title: String, andMessage message: String, _ completion: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion()
        }))

        present(alert, animated: true)
    }

    func showTextInputPrompt(forTitle title: String? = nil, withMessage message: String,
                             proceedTitle procced: String = "OK", completionBlock: @escaping ((Bool, String?) -> Void)) {

        let prompt = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completionBlock(false, nil)
        }
        weak var weakPrompt = prompt
        let okAction = UIAlertAction(title: procced, style: .default) { _ in
            guard let text = weakPrompt?.textFields?.first?.text else { return }
            completionBlock(true, text)
        }
        prompt.addTextField(configurationHandler: nil)
        prompt.addAction(cancelAction)
        prompt.addAction(okAction)
        present(prompt, animated: true, completion: nil)
    }
}




struct AlertModel {
    var title: String?
    var message: String?
    var cancel: AlertActionModel?
    var proceed: AlertActionModel
    var style: UIAlertController.Style
}

struct AlertActionModel {
    var title: String
    var style: UIAlertAction.Style
    var handler: ((UIAlertAction) -> Void)?
}

