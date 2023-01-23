//
//  NewsFeedViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//


import UIKit

class NewsFeedCollectionViewCell: BaseCollectionCell<NewsPost> {

    let myView = NewsFeedCellView()
    let formatter = DateFormatter()
            
    override var item: NewsPost? {
        didSet {
            guard let news = item else { return }
            myView.titleLabel.text = news.title
            myView.descLabel.text = news.desc
            
            formatter.dateStyle = .medium
            myView.dateLabel.text = formatter.string(from: news.date)
            
            myView.siteLogo.image = .picOne
            
            contentView.addSubview(myView)
            myView.frame = contentView.bounds
        }
    }
}




class NewsFeedCollectionController: BaseCollectionController<NewsFeedCollectionViewCell, NewsPost> {

    var allNews = [NewsPost]()
    
    var postCount: Int? = 0
    var profileSelectedAction: ((NewsPost) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTableView { sender in
            guard sender != false else { return } // Send error or connection issue etc
        }
    }
    

    func updateTableView(completion: @escaping (Bool) -> Void) {
        NewsFeedSingleton.shared.getTempNews { [weak self] newsFeed in
            self?.items = newsFeed
            self?.allNews = newsFeed
            self?.postCount = newsFeed.count
            self?.collectionView.reloadData()
            self?.collectionView.layoutIfNeeded()
            completion(true)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        return CGSize(width: width, height: 100)
    }
}


extension NewsFeedCollectionController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? NewsFeedCollectionViewCell else { return UICollectionViewCell() }
        
        cell.item = items?[indexPath.row]
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 7
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let link = items?[indexPath.row].link else { return }
        
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}
    

