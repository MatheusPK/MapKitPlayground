//
//  ViewController.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 01/06/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var map = MapView()
    var mapElements = MapElementsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(map)
        map.setupMapConstraints(self)
        mapElements.addUIButtons(self)
        
        

        // Do any additional setup after loading the view.
    }
}

