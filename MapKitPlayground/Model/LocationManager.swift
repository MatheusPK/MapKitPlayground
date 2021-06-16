//
//  LocationManager.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 15/06/21.
//

import Foundation
import CoreLocation
import MapKit


class LocationManager: CLLocationManager {
    
    var mapDelegate: MapView!
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapDelegate.showsUserLocation = true
            startUpdatingLocation()
            break
        case .denied:
            mapDelegate.setUpMapZoomLimits()
            break
        case .notDetermined:
            requestWhenInUseAuthorization()
        case .restricted:
            // Show alert
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // the user didn't turn it on
        }
    }
}
