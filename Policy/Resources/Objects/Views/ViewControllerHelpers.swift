//
//  ViewControllerHelpers.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit

extension UIViewController {
    
    func addController(_ controller: UIViewController, to someview: UIView) {
        controller.view.frame = someview.bounds
        willMove(toParent: self)
        someview.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    func addCollectionView(_ controller: UICollectionViewController, to someview: UIView) {
        controller.view.frame = someview.bounds
        willMove(toParent: self)
        someview.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    func addTableView(_ controller: UITableViewController, to someview: UIView) {
        controller.view.frame = someview.bounds
        willMove(toParent: self)
        someview.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
//
//    func addController(_ child: UIViewController) {
//        addChild(child)
//        view.addSubview(child.view)
//        child.didMove(toParent: self)
//    }
//
//    func removeController() {
//
//        guard parent != nil else { return }
//        willMove(toParent: nil)
//        view.removeFromSuperview()
//        removeFromParent()
//    }
}

