//
//  CollectionView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

struct CollectionLayout {
    var layout = UICollectionViewFlowLayout()
    
    init(lineSpacing spacing: CGFloat = 0, InteritemSpacing itemSpacing: CGFloat = 0,
                                            scrollDirection scroll: UICollectionView.ScrollDirection) {
        self.layout.scrollDirection = scroll
        self.layout.minimumLineSpacing = spacing
        self.layout.minimumInteritemSpacing = itemSpacing
        self.layout.sectionHeadersPinToVisibleBounds = true
    }
}


class BaseCollectionCell<U>: UICollectionViewCell, CollectionCellView {
    var item: U? { didSet { backgroundColor = .clear } }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes { return layoutAttributes }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension BaseCollectionController {
    func setScroll(to direction: UICollectionView.ScrollDirection, showsIndicator indicator: Bool) {
        switch direction {
        case .vertical:
            collectionView.alwaysBounceVertical = true
            collectionView.showsVerticalScrollIndicator = indicator
        case .horizontal:
            collectionView.alwaysBounceHorizontal = true
            collectionView.showsHorizontalScrollIndicator = indicator
        default: break
        }
    }
}
