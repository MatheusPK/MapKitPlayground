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
    
    var map = MapView()
    var mapElements = MapElementsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapElements)
        mapElements.addUIButtons()
        mapElements.mapDelegate = map
        mapElements.addSubview(map)
        map.setupMapView()
        map.locationManager.checkLocationServices()
        
        
    }
}

