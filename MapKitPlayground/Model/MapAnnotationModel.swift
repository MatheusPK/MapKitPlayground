//
//  MapAnotationModel.swift
//  MapKitPlayground
//
//  Created by Gáudio Ney on 15/06/21.
//

import MapKit
import CoreLocation

class MapAnnotationModel: NSObject, MKAnnotation {
    
    var username: String
    var music: String
    var musicAuthor: String
    var musicImage: UIImage?
    var coordinate: CLLocationCoordinate2D
    
    init(username: String, music: String, musicAuthor: String, coordinate: CLLocationCoordinate2D) {
        self.username = username
        self.music = music
        self.musicAuthor = musicAuthor
        self.coordinate = coordinate
        super.init()   
    }
    
    
}
