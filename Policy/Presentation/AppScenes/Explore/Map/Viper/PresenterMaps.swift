//
//  PresenterMaps.swift
//  Policy
//
//  Created by Bradley Ensign on 1/10/23.
//

//import UIKit
//
//class MapPresenter: MapViewProtocol {
//    var saveStatus: SaveStatus = .success
//    var view: MapPresenterToViewProtocol?
//    var router: MapPresenterToRouterProtocol?
//    var interactor: MapPresenterToInteractorProtocol?
//
//
//    func pushControllerToLocation() {
//        router?.pushControllerToLocation()
//    }
//
//    func throwError() {
//        view?.updateView(with: .failure)
//    }
//}
//
//extension MapPresenter: MapInteractorToPresenterProtocol {
//    func mapLocationFailure() {
//        saveStatus = .failure
//        throwError()
//    }
//
//    func mapLocationSuccess() {
//        saveStatus = .success
//    }
//}
