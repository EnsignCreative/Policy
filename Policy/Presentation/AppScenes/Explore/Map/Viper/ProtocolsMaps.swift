//
//  ProtocolsMaps.swift
//  Policy
//
//  Created by Bradley Ensign on 1/10/23.
//

//import UIKit
//
//protocol MapViewProtocol: AnyObject {
//    var view: MapPresenterToViewProtocol? { get set }
//    var router: MapPresenterToRouterProtocol? { get set }
//    var interactor: MapPresenterToInteractorProtocol? { get set }
//
//    func pushControllerToLocation()
//    func throwError()
//}
//
//protocol MapPresenterToRouterProtocol: AnyObject {
//    static func createModule() -> MapPageController
//    func pushControllerToLocation()
//}
//
//protocol MapPresenterToInteractorProtocol: AnyObject {
//    var presenter: MapInteractorToPresenterProtocol? { get set }
//    func searchArea(with area: String)
//
//}
//
//protocol MapInteractorToPresenterProtocol: AnyObject {
//    func mapLocationSuccess()
//    func mapLocationFailure()
//}
//
//protocol MapPresenterToViewProtocol: AnyObject {
//    func updateView(with value: SaveStatus)
//}
//
//protocol MapsProtocol {
//    var thisView: MapPageView { get set }
//    func setUIComponents()
//}
//
//extension MapsProtocol {
//    func setUIComponents() {
//
//    }
//}
