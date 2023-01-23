//
//  InterestsCellView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class InterestsCellView<U>: UICollectionViewCell, CollectionCellView {
    
    var item: U?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubViews()
        setConstraints()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    var interestImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(.heart, for: .normal)
        button.setImage(.heartFilled, for: .selected)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setSubViews() {
        addSubview(interestImage)
        addSubview(likeButton)
        addSubview(title)
    }
    
    private func setConstraints() {

        interestImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        interestImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        interestImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        interestImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        likeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        likeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true

        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        title.rightAnchor.constraint(equalTo: likeButton.leftAnchor, constant: -4).isActive = true
    }
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes:
                                                   UICollectionViewLayoutAttributes) ->
                                                   UICollectionViewLayoutAttributes { return layoutAttributes }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


