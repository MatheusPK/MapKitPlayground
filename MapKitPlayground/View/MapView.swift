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
    
    func setupMapConstraints(_ vc: UIViewController) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            self.topAnchor.constraint(equalTo: vc.view.topAnchor),
            self.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            self.leftAnchor.constraint(equalTo: vc.view.leftAnchor),
            self.rightAnchor.constraint(equalTo: vc.view.rightAnchor)
        ])
    }
    
    func setUpMapZoomLimits () {
        let gaveaLocation = CLLocation(latitude: -22.977092, longitude: -43.230457)
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

private extension MKMapView {
    
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
    
}
