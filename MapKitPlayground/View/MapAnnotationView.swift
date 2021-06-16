//
//  MapAnotationView.swift
//  MapKitPlayground
//
//  Created by Gáudio Ney on 15/06/21.
//

import Foundation
import MapKit

//class MapAnnotationView: MKMarkerAnnotationView {
//    
//    override var annotation: MKAnnotation? {
//        willSet {
//            // 1
//            guard let mapAnnotation = newValue as? MapAnnotationModel else {
//                return
//            }
//            canShowCallout = true
//            calloutOffset = CGPoint(x: -5, y: 5)
//            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            
//            // 2
//            markerTintColor = mapAnnotation.markerTintColor
//            if let letter = mapAnnotation.discipline?.first {
//                glyphImage = mapAnnotation.image
//            }
//        }
//    }
//}

