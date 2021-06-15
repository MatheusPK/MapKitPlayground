//
//  MapAnotationModel.swift
//  MapKitPlayground
//
//  Created by Gáudio Ney on 15/06/21.
//

import Foundation
import MapKit
import CoreLocation
import Contacts

class MapAnnotationModel: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    var markerTintColor: UIColor  {
        switch discipline {
        case "Monument":
            return .red
        case "Mural":
            return .cyan
        case "Plaque":
            return .blue
        case "Sculpture":
            return .purple
        default:
            return .green
        }
    }
    
    var image: UIImage {
        guard let name = discipline else {
            return (UIImage(systemName: "flag.fill"))!
        }
        
        switch name {
        case "Monument":
            return UIImage(systemName: "gamecontroller.fill")!
        case "Sculpture":
            return UIImage(systemName: "camera.fill")!
        case "Plaque":
            return UIImage(systemName: "book.fill")!
        case "Mural":
            return UIImage(systemName: "person.crop.square.fill")!
        default:
            return UIImage(systemName: "phone.fill")!
        }
    }
    
    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    
    init?(feature: MKGeoJSONFeature) {
        // 1
        guard
            let point = feature.geometry.first as? MKPointAnnotation,
            let propertiesData = feature.properties,
            let json = try? JSONSerialization.jsonObject(with: propertiesData),
            let properties = json as? [String: Any]
        else {
            return nil
        }
        
        // 3
        title = properties["title"] as? String
        locationName = properties["location"] as? String
        discipline = properties["discipline"] as? String
        coordinate = point.coordinate
        super.init()
    }
    
    
    var subtitle: String? {
        return locationName
    }
    
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }
        
        let addressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
}


