//
//  NewsFeedView.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//



import UIKit


class NewsFeedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setConstraints()
        backgroundColor = .white
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "World News"
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsCollectionView: NewsFeedCollectionController = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        let collection = NewsFeedCollectionController(collectionViewLayout: layout)

        collection.view.backgroundColor = .clear
        collection.collectionView.showsVerticalScrollIndicator = false
        collection.collectionView.alwaysBounceVertical = true
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    lazy var refresh: UIRefreshControl = {
        let control = UIRefreshControl()
        let font = UIFont.systemFont(ofSize: 12)
        let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.systemBlue]
        control.attributedTitle = NSAttributedString(string: "Fetching News ...", attributes: attributes)
        control.tintColor = .systemBlue
        control.isHidden = true
        return control
    }()

    
    private func addSubViews() {
        addSubview(title)
        addSubview(newsCollectionView.view)
    }
    
    private func setConstraints() {
        title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        newsCollectionView.view.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12).isActive = true
        newsCollectionView.view.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        newsCollectionView.view.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        newsCollectionView.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}



extension NewsFeedView {
    func refreshTableView() {
        newsCollectionView.collectionView.refreshControl?.beginRefreshing()

        newsCollectionView.updateTableView(completion: { [weak self] _ in
            self?.newsCollectionView.collectionView.refreshControl?.endRefreshing()
        })
    }
}


