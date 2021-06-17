//
//  MapView.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 15/06/21.
//

import Foundation
import MapKit
import UIKit
import CoreLocation

class MapView: MKMapView, CLLocationManagerDelegate {
    
    var locationManager = LocationManager()
    
    func setupMapView() {
        
        guard let parentView = self.superview else {fatalError("View not added")}
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parentView.topAnchor),
            self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            self.leftAnchor.constraint(equalTo: parentView.leftAnchor),
            self.rightAnchor.constraint(equalTo: parentView.rightAnchor)
        ])
        
        locationManager.delegate = self
        locationManager.mapDelegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
        setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManager.checkLocationAuthorization()
    }
        
    func setUpMapZoomLimits () {
        let gaveaLocation = Locations.gavea.geoLocation
        let region = MKCoordinateRegion(
            center: gaveaLocation.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000)
        self.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 1000)
        self.setCameraZoomRange(zoomRange, animated: true)
        
        self.setCenter(CLLocationCoordinate2D(latitude: -22.977092, longitude: -43.230457), animated: true)
    }
}
extension ViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let mapAnotation = view.annotation as? MapAnnotationModel
        
        else {
            return
        }
    }
}
