//
//  FungoMapView.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 02/06/21.
//

import MapKit
import UIKit
import CoreLocation

class FungoMapView:MKMapView, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    func setupMapView(_ vc: UIViewController) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: vc.view.topAnchor),
            self.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            self.rightAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.rightAnchor),
            self.leftAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // chamada quando chama a startUpdatingLocation
//        guard let location = locations.last else {return}
//        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
//        self.setRegion(region, animated: true)
    }
    
    func goToMyLocation() {
        guard let location = locationManager.location else {return}
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        self.setRegion(region, animated: true)
    }
    
    
    
    // MarcarMapa 
    //Apagar mapa
    // MinhaLocalizacao
    /* Clicar marcacao -> {
        se Ditancia > x {
            nao entra
        } senao {
            entra
        }
     }

 
    */
}
