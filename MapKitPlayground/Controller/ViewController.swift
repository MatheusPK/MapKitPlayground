//
//  ViewController.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 01/06/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    //private var mapAnnotation: [MapAnnotationModel] = []
    
    //let initialLocation = CLLocation(latitude: -22.97998, longitude: -43.23429)
    
    var map = MapView()
    var mapElements = MapElementsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(map)
        view.addSubview(mapElements)
        mapElements.addUIButtons()
        mapElements.mapDelegate = map
        mapElements.addSubview(map)
        
        map.setupMapView()
        map.locationManager.checkLocationServices()
        
    }
}

