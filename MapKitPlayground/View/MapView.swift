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

class MapView: MKMapView, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = LocationManager()
    var mapAnnotations:[MapAnnotationModel] = []
    
    func setupMapView() {
        
        delegate = self
        
        guard let parentView = self.superview else {fatalError("View not added")}
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parentView.topAnchor),
            self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            self.leftAnchor.constraint(equalTo: parentView.leftAnchor),
            self.rightAnchor.constraint(equalTo: parentView.rightAnchor)
        ])
        
        locationManager.delegate = self
        locationManager.mapDelegate = self
        
        let annotation1 = MapAnnotationModel(username: "gaudio", music: "sweather weathers", musicAuthor: "gaudiao", coordinate: CLLocationCoordinate2D(latitude: -22.977092, longitude: -43.230457))
        
        let annotation2 = MapAnnotationModel(username: "matheus", music: "sweather weathers", musicAuthor: "matheus", coordinate: CLLocationCoordinate2D(latitude: -22.95162, longitude: -43.21077))
        
        let annotation3 = MapAnnotationModel(username: "pg", music: "rebolation", musicAuthor: "pg", coordinate: CLLocationCoordinate2D(latitude: -22.957000, longitude: -43.230000))
        
        mapAnnotations.append(annotation1)
        mapAnnotations.append(annotation2)
        mapAnnotations.append(annotation3)
        
        
        registerMapAnnotationViews()
        
        for annotation in mapAnnotations {
            addAnnotation(annotation)
        }
        
        
        
    }
    
    private func registerMapAnnotationViews() {
        register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(MapAnnotationModel.self))
    }
    
    private func setupAnnotationView(for annotation: MapAnnotationModel, on mapView: MKMapView) -> MKAnnotationView {
        let identifier = NSStringFromClass(MapAnnotationModel.self)
        let view = dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        if let markerAnnotationView = view as? MKMarkerAnnotationView {
            markerAnnotationView.animatesWhenAdded = true
            markerAnnotationView.canShowCallout = true
            markerAnnotationView.markerTintColor = UIColor(named: "internationalOrange")
            let rightButton = UIButton(type: .detailDisclosure)
            markerAnnotationView.rightCalloutAccessoryView = rightButton
        }

        return view
    }
    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("chamei a mapView delegate")
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        
        var annotationView: MKAnnotationView?
        print("to na view for")
        if let annotation = annotation as? MapAnnotationModel {
            annotationView = setupAnnotationView(for: annotation, on: self)
        }
        
        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
        setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManager.checkLocationAuthorization()
    }
        
    func setUpMapZoomLimits () {
        let gaveaLocation = Locations.gavea.geoLocation
        let region = MKCoordinateRegion(
            center: gaveaLocation.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000)
        self.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 1000)
        self.setCameraZoomRange(zoomRange, animated: true)
        
        self.setCenter(CLLocationCoordinate2D(latitude: -22.977092, longitude: -43.230457), animated: true)
    }
}
