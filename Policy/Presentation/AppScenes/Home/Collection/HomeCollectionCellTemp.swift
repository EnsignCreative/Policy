//
//  HomeCollectionCellTemp.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//


import UIKit

class HomeCollectionCellView<U>: UICollectionViewCell, CollectionCellView {
    
    var item: U?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        header.profilePic.layer.cornerRadius = header.profilePic.frame.size.height / 2
        header.profilePic.layoutIfNeeded()
    }

    
    var header: PersonalPostHeader = {
       let header = PersonalPostHeader()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    var post: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .black
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var footer: PersonalPostFooter = {
       let header = PersonalPostFooter()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    private func setSubViews() {
        addSubview(header)
        addSubview(post)
        addSubview(footer)
    }
    
    private func setConstraints() {

        header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        header.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        header.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/10).isActive = true

        post.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        post.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        post.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        post.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 6.5/10).isActive = true
        
        footer.topAnchor.constraint(equalTo: post.bottomAnchor).isActive = true
        footer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        footer.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        footer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2.5/10).isActive = true

    }
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes:
                                                   UICollectionViewLayoutAttributes) ->
                                                   UICollectionViewLayoutAttributes { return layoutAttributes }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

















