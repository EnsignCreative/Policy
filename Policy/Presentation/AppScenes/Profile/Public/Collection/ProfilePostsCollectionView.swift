//
//  ProfilePostsCollectionView.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//


import UIKit

class ImageOnlyCellView<U>: UICollectionViewCell, CollectionCellView {
    
    var item: U? { didSet { } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setSubViews() {
        addSubview(imageView)
    }
    
    private func setConstraints() {
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes:
                                                   UICollectionViewLayoutAttributes) ->
                                                   UICollectionViewLayoutAttributes { return layoutAttributes }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


