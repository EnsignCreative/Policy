//
//  ProfileHeader.swift
//  Policy
//
//  Created by Bradley Ensign on 1/13/23.
//



import UIKit


class ProfileHeaderView: UIView {
    
        var data: Any? {
            didSet {
                guard let profile = data as? ProfileInfo else { return }
                profileImage.image = profile.profileImage
                supporterCount.setTitle(String(profile.supporters), for: .normal)
                supportingCount.setTitle(String(profile.supporting), for: .normal)
                layoutIfNeeded()
            }
        }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.layoutIfNeeded()
    }

    
    
    var profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .black
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.isUserInteractionEnabled = false
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    let supporters: UILabel = {
        let label = UILabel()
        label.text = "Supporters"
        label.textColor = .black
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let supporting: UILabel = {
        let label = UILabel()
        label.text = "Supporting"
        label.textColor = .black
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var supporterCount: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var supportingCount: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    func setSubViews() {
        addSubview(profileImage)
        addSubview(supporters)
        addSubview(supporting)
        addSubview(supporterCount)
        addSubview(supportingCount)
    }
    
    func setConstraints() {
        profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        supporters.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: -12).isActive = true
        supporters.rightAnchor.constraint(equalTo: profileImage.leftAnchor).isActive = true
        supporters.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        supporters.heightAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 1/4).isActive = true
        
        supporterCount.topAnchor.constraint(equalTo: supporters.bottomAnchor).isActive = true
        supporterCount.centerXAnchor.constraint(equalTo: supporters.centerXAnchor).isActive = true
        supporterCount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        supporterCount.heightAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 1/4).isActive = true
        
        supporting.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: -12).isActive = true
        supporting.leftAnchor.constraint(equalTo: profileImage.rightAnchor).isActive = true
        supporting.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        supporting.heightAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 1/4).isActive = true
        
        supportingCount.topAnchor.constraint(equalTo: supporting.bottomAnchor).isActive = true
        supportingCount.centerXAnchor.constraint(equalTo: supporting.centerXAnchor).isActive = true
        supportingCount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        supportingCount.heightAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 1/4).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




