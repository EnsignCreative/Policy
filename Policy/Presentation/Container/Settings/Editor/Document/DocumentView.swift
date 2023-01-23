//
//  DocumentView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class DocumentController: UIViewController, DocumentViewController {
    var presenter: DocumentPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
}

