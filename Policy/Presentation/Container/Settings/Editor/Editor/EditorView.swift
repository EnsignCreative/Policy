//
//  EditorView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class EditorController: UIViewController, EditorViewController {
    var presenter: EditorPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
}
