//
//  BioInteractor.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class BioInteractor: BioInteractable {
    var presenter: BioPresentable?
    
    func checkAvailablity(for username: String?, _ completion: @escaping ((String?) -> Void)) {
        completion(username)
    }
}

