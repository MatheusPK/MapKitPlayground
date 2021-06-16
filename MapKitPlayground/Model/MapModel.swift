//
//  MapModel.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 15/06/21.
//

import Foundation
import MapKit
import CoreLocation


enum Locations {
    case gavea
    
    var geoLocation: CLLocation {
        switch self {
            case .gavea:
                return CLLocation()
            default:
                return CLLocation()
        }
    }
    
}

class MapModel {
    private var locationManager: CLLocationManager = CLLocationManager()
    private let initialLocation = CLLocation(latitude: -22.977092, longitude: -43.230457) // Gavea location
//    private let userAuthStatus: CLAuthorizationStatus
    
    

    
}


