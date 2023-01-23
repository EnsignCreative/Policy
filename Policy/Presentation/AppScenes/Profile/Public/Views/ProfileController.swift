//
//  ProfileController.swift
//  Policy
//
//  Created by Bradley Ensign on 1/13/23.
//


import UIKit

class ProfileController: UIViewController {
    
    var data: ProfileInfo?
    var subview = ProfileView()

    override func loadView() { view = subview }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRequirements()
        setupNavigation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setRequirements() {
        let profileData = ProfileSingleton.shared.getProfileInfo()
        data = profileData
        subview.data = profileData
        subview.bodyView.segmentControl.addTarget(self, action: #selector(segmentChanged(_ :)), for: .primaryActionTriggered)
    }
    
    
    private func setupNavigation() {
        title = data?.username
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .menu, style: .done, target: self, action: #selector(menuButtonTap))
    }
}


extension ProfileController {
    @objc func menuButtonTap() {
        print("Settings tapped")
    }
    
    // Temp
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        guard let profile = data else { return }
        
        switch sender.selectedSegmentIndex {
        case 0: displayPosts(for: profile.posts)
        case 1: displayPosts(for: profile.votes)
        case 2: displayPosts(for: profile.activity)
        default: break
        }
    }
    private func displayPosts(for category: [ProfilePostModel]) {
        subview.bodyView.profilePosts.items = category
        subview.bodyView.profilePosts.collectionView.reloadData()
        subview.bodyView.profilePosts.view.layoutIfNeeded()
    }
}



