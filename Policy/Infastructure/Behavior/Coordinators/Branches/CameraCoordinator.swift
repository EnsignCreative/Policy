//
//  CameraCoordinator.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

//import UIKit
//
//class CameraCoordinator: Coordinator {
//
//    var navigationController: NavigationController
//    var childCoordinators = [Coordinator]()
//    var flowReference: FlowReference?
//    var delegate: FinishDelegate?
//
//    required init(_ navigationController: NavigationController) {
//        self.navigationController = navigationController
//        flowReference = .camera
//    }
//
//    func pushTo<T: CameraFlow>(_ controller: T.Type, with reference: PageReference, and data: Any?) {
//        let viewController = CameraRouter.create(controller, with: self)
//        viewController.title = reference.title
//        navigationController.pushViewController(viewController, animated: true)
//    }
//
//    func transitionTo(_ instance: PageReference, withData data: Any?) {
//        switch instance {
//        case .camera: pushTo(CameraController.self, with: instance, and: data)
//        case .editor: pushTo(ImageEditorController.self, with: instance, and: data)
//        case .caption: pushTo(CaptionCreatorController.self, with: instance, and: data)
//        case .confirm: pushTo(ConfirmPostController.self, with: instance, and: data)
//        case .finish: deinitalize(flowReference)
//        default: break }
//
//    }
//}
//
