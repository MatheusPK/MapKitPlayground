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
    
    private var viewController = UIViewController()
    
    func setupMapConstraints(_ vc: UIViewController) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: vc.view.topAnchor),
            self.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            self.leftAnchor.constraint(equalTo: vc.view.leftAnchor),
            self.rightAnchor.constraint(equalTo: vc.view.rightAnchor)
        ])
    }
    
    
}
