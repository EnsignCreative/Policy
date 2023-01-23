//
//  MapViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 1/10/23.
//


import Foundation
import UIKit
import MapKit
import CoreLocation



protocol Mapable {
    func getAddressFromLatLon(withlatitude latitude: String, andLongitude longitude: String)
}

extension Mapable {
    
    func getAddressFromLatLon(withlatitude latitude: String, andLongitude longitude: String) {
        var center = CLLocationCoordinate2D()
        guard let lat = Double("\(latitude)") else { return }
        guard let long = Double("\(longitude)") else { return }
        
        let geoCoder = CLGeocoder()
        center.latitude = lat
        center.longitude = long
        
        let location = CLLocation(latitude: center.latitude, longitude: center.longitude)
        
        geoCoder.reverseGeocodeLocation(location, completionHandler:
            {(placemarks, error) in
                guard let placeMarker = placemarks, error == nil else {
                    print(error ?? "PlaceMarker Error")
                    return
                }
                
                if let placeMark = placeMarker.first {
                    let address = "\(placeMark.subLocality ?? ""),"
                                + "\(placeMark.subLocality ?? ""),"
                                + "\(placeMark.thoroughfare ?? ""),"
                                + "\(placeMark.locality ?? ""),"
                                + "\(placeMark.country ?? ""),"
                                + "\(placeMark.postalCode ?? "")"
                    
                print(address)

                }
        })
    }
}


extension MKMapView {
    func zoomToUserLocation() {
        
        let userLocation = self.centerCoordinate //locationManager.location?.coordinate else { return }
        let coordinate = CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude)
        var span = self.region.span
        span.longitudeDelta = 0.009
        span.latitudeDelta = 0.009

        let region = MKCoordinateRegion(center: coordinate, span: span)
        self.setRegion(region, animated: true)
    }
}





 
class MapView: UIView, Mapable {
    
    var locationManager = CLLocationManager()
    var pinAnnotationView: MKPinAnnotationView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mapView)
        mapView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mapView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

    }
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        map.mapType = .standard
        map.showsCompass = true
        map.showsBuildings = true
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




extension MapView: MKMapViewDelegate {
    
    //Selecting Annotation Views
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        guard let pinToZoomOn = view.annotation else { return }
        var span = mapView.region.span
        span.latitudeDelta = 0.09
        span.longitudeDelta = 0.09
        
        let region = MKCoordinateRegion(center: pinToZoomOn.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let address = locationManager.location?.coordinate
        print(address!)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("Tells Delegate That One of The Annotation Views Was Deselected")
        print("Good Area To Remove Business Info At the Bottom Etc")
        
    }
}


extension MapView: CLLocationManagerDelegate {
        
    func setupLocatinManager(withCompletionHandler completion: @escaping (_: Bool) -> Void) {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            self.mapView.delegate = self
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.distanceFilter = 10.0
            locationManager.startUpdatingLocation()
            completion(true)
        }
        completion(false)
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("Check to see if this wa called")
        let visualScope: Double = 200
        let region = MKCoordinateRegion(center: newLocation.coordinate,
                                        latitudinalMeters: visualScope,
                                        longitudinalMeters: visualScope)
        
        self.mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    
      func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {

      }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
}
    

    // Map Position Changes
    //    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
    //        print("Will Change")
    //    }
    //    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
    //        print("Did Change")
    //    }
    //    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    //        print("Changed Animated")
    //    }
        
        
    // Loading Map Data
    //    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
    //        print("Will Start Loading")
    //
    //    }
    //    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
    //        print("Did Finish Loading")
    //    }
    //    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
    //        print("Print Failed Loading")
    //    }
    //    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
    //        print("Will Start Rendering")
    //    }
    //    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
    //        print("Finished Rendering")
    //    }
        
        
        
    // Tracking User Location
    //    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
    //        print("Start Locating User")
    //    }
    //    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
    //        print("Stopped Locating User")
    //    }
    //    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    //        print("Updated User Location")
    //    }
    //    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
    //        print("Fail to Locate User")
    //    }
    //    func mapView(_ mapView: MKMapView, didChange: MKUserTrackingMode, animated: Bool) {
    //        print("User View Did Change")
    //    }
        
        
    // Managing Annotation Views
    //    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    //        print("returns the annotation View")
    //    }
    //    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
    //        print("Tells Delegate That Another Annotation View Was Added")
    //    }
