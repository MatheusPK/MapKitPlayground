//
//  ViewController.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 01/06/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //private var mapAnnotation: [MapAnnotationModel] = []
    
    //let initialLocation = CLLocation(latitude: -22.97998, longitude: -43.23429)
    
    var map = MapView()
    var mapElements = MapElementsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(map)
        map.setupMapView(self)
        map.locationManager.checkLocationServices()
        mapElements.addUIButtons(self)
        mapElements.mapDelegate = map
    }
}

