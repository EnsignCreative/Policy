//
//  HomeCollectionCell.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

//import UIKit
//
//class HomeCollectionCellView<U>: UICollectionViewCell, CollectionCellView {
//
//    var item: U?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setSubViews()
//        setConstraints()
//        backgroundColor = .white
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        header.profilePic.layer.cornerRadius = header.profilePic.frame.size.height / 2
//        header.profilePic.layoutIfNeeded()
//    }
//
//
//    var header: VotingCollectionHeader = {
//       let header = VotingCollectionHeader()
//        header.translatesAutoresizingMaskIntoConstraints = false
//        return header
//    }()
//
//    var body: VotingCollectionBody = {
//       let header = VotingCollectionBody()
//        header.translatesAutoresizingMaskIntoConstraints = false
//        return header
//    }()
//
//    var footer: VotingCollectionFooter = {
//       let header = VotingCollectionFooter()
//        header.translatesAutoresizingMaskIntoConstraints = false
//        return header
//    }()
//
//    private func setSubViews() {
//        addSubview(header)
//        addSubview(body)
//        addSubview(footer)
//    }
//
//    private func setConstraints() {
//
//        header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        header.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        header.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//        header.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/10).isActive = true
//
//        body.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
//        body.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        body.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//        body.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 6.5/10).isActive = true
//
//        footer.topAnchor.constraint(equalTo: body.bottomAnchor).isActive = true
//        footer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        footer.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//        footer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2.5/10).isActive = true
//
//    }
//
//
//    override func preferredLayoutAttributesFitting(_ layoutAttributes:
//                                                   UICollectionViewLayoutAttributes) ->
//                                                   UICollectionViewLayoutAttributes { return layoutAttributes }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//
//
//













