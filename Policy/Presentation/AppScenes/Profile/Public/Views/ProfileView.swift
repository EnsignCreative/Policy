//
//  ProfileView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//


import UIKit

class ProfileView: UIView {
        
    var data: Any? {
        didSet {
            guard let profile = data as? ProfileInfo else { return }
            headerView.data = profile
            bodyView.data = profile
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }

    let headerView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let bodyView: ProfileBodyView = {
        let view = ProfileBodyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    func setSubViews() {
        addSubview(headerView)
        addSubview(bodyView)
    }
    
    func setConstraints() {
        headerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/5).isActive = true
        headerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        bodyView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2).isActive = true
        bodyView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bodyView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}










extension ProfileView {
//    func selected(_ cell: Any?) {
//        guard let cell = cell as? ProfilePostModel else { return }
//        print(cell.postId)
//    }
}




