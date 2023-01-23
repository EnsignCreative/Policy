//
//  CollectionViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//



// This page needs cleaning
import UIKit

protocol CollectionViewDelegate {
    func selected(_ cell: Any?)
    func refresh(_ completion: @escaping (Any?) -> ())
    func fetch(_ completion: @escaping (Any?) -> ())
}

extension CollectionViewDelegate {
    func fetch(_ completion: @escaping (Any?) -> ()) { }
    func refresh(_ completion: @escaping (Any?) -> ()) { }
}


enum CollectionLoadType {
    case notifications, messages, chat, homeFeed, explore, following, followers, suggestedPeople, suggestedPosts, profilePosts
}


protocol CollectionModel { }

protocol CollectionCellView: UICollectionViewCell {
    associatedtype SomeModel where SomeModel: Any
    var item: SomeModel? { get set }
}




// Seprate refresh control from selection
//protocol CollectionRefreshDelegate {
//    func fetch(_ load: CollectionLoadType, _ completion: @escaping (Any?) -> ())
//    func refresh(_ load: CollectionLoadType, _ completion: @escaping (Any?) -> ())
//    func fetch(suggestions load: SuggestionLoadType, _ completion: @escaping (Any?) -> ())
//}

//enum CollectionLoadType {
//    case notifications, messages, chat, homeFeed, explore, following, followers, profilePosts
//}

