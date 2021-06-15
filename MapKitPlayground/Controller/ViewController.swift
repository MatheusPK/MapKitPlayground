//
//  ViewController.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 01/06/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    private var mapAnnotation: [MapAnnotationModel] = []
    
    let initialLocation = CLLocation(latitude: -22.97998, longitude: -43.23429)
    
    var map = MapView()
    
    var mapElements = MapElementsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(map)
        
        map.delegate = self
        map.setupMapConstraints(self)
        map.setUpMapZoomLimits()
        map.centerToLocation(initialLocation)
        mapElements.addUIButtons(self)
        map.register(
          MapAnnotationModel.self,
          forAnnotationViewWithReuseIdentifier:
            MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        

        // Do any additional setup after loading the view.
    }
}

