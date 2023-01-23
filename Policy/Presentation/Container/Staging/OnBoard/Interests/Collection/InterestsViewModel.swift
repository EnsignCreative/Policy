//
//  InterestsViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class InterestsViewModel: InterestsCellView<InterestCellModel> {
    override var item: InterestCellModel? {
        didSet {
            guard let interest = item else { return }
            title.text = interest.name.value
            interestImage.image = interest.image
            likeButton.isSelected = interest.isSelected
        }
    }
}



struct InterestCellModel {
    let image: UIImage
    let isSelected: Bool
    let name: TempInterest
    
    init(name: TempInterest, image: UIImage, isSelected: Bool) {
        self.name = name
        self.image = image
        self.isSelected = isSelected
    }
}

























extension InterestsController {
    func getInterests() -> [InterestCellModel] {
        let one = InterestCellModel(name: .news, image: .picOne, isSelected: false)
        let one2 = InterestCellModel(name: .sports, image: .picTwo, isSelected: false)
        let one3 = InterestCellModel(name: .adventure, image: .picThree, isSelected: false)
        let one4 = InterestCellModel(name: .history, image: .picFour, isSelected: false)
        let one5 = InterestCellModel(name: .tech, image: .picFive, isSelected: false)
        let one6 = InterestCellModel(name: .fitness, image: .picOne, isSelected: false)
        let one7 = InterestCellModel(name: .sports, image: .picTwo, isSelected: false)
        let one8 = InterestCellModel(name: .history, image: .picOne, isSelected: false)
        let one9 = InterestCellModel(name: .fitness, image: .picThree, isSelected: false)
        let one10 = InterestCellModel(name: .news, image: .picTwo, isSelected: false)
        let one11 = InterestCellModel(name: .adventure, image: .picFour, isSelected: false)
        let one12 = InterestCellModel(name: .tech, image: .picFive, isSelected: false)
        let one13 = InterestCellModel(name: .fitness, image: .picFour, isSelected: false)
        let one14 = InterestCellModel(name: .history, image: .picThree, isSelected: false)

        return [one, one2, one3, one4, one5, one6, one7, one8, one9, one10, one11, one12, one13, one14]
    }
}


enum TempInterest: String {
    case news, sports, adventure, history, tech, fitness
    var value: String { return rawValue.capitalizeFirstLetter() }
}
