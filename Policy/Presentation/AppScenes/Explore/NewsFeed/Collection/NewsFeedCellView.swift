//
//  NewsFeedCellView.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//


import UIKit

class NewsFeedCellView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        constraints()
        backgroundColor = .white
    }
    
    var siteLogo: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.textColor = .black
        view.backgroundColor = .clear
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.textColor = .black
        view.backgroundColor = .clear
        view.font = UIFont.systemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .descColor
        view.textAlignment = .right
        view.backgroundColor = .clear
        view.font = UIFont.systemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    private func addViews() {
        addSubview(siteLogo)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(dateLabel)
    }
    
     private func constraints() {

        siteLogo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        siteLogo.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        siteLogo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 3/4).isActive = true
        siteLogo.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 3/4).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: siteLogo.rightAnchor, constant: 4).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descLabel.leftAnchor.constraint(equalTo: siteLogo.rightAnchor, constant: 4).isActive = true
        descLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        descLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 2).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     deinit {
         NotificationCenter.default.removeObserver(self)
     }
}
