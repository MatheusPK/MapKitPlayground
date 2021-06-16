//
//  MapElementsView.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 15/06/21.
//

import UIKit
import MapKit


class MapElementsView: UIView {
    
    var mapDelegate: MapView!
    
    let myLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("localizacao atual", for: .normal)
        button.backgroundColor = .systemBlue
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        button.imageView?.tintColor = .white
        button.imageEdgeInsets.left = -10
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let annotationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.imageView?.tintColor = .black
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
    }()
    
    func addUIButtons() {
        
        
        guard let parentView = self.superview else {fatalError("View not added")}
        
        parentView.addSubview(myLocationButton)
        parentView.addSubview(annotationButton)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            leftAnchor.constraint(equalTo: parentView.leftAnchor),
            rightAnchor.constraint(equalTo: parentView.rightAnchor)
        ])
        
        myLocationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLocationButton.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            myLocationButton.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: 100)
        ])
        
        annotationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            annotationButton.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -100),
            annotationButton.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -100),
            annotationButton.heightAnchor.constraint(equalToConstant: 40),
            annotationButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        myLocationButton.addTarget(self, action: #selector(goToMyLocation), for: .touchUpInside)
        annotationButton.addTarget(self, action: #selector(addAnnotation), for: .touchUpInside)
        
    }
    
    @objc func goToMyLocation() {
        guard let location = mapDelegate.locationManager.location else {return}
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapDelegate.setRegion(region, animated: true)
    }
    
    @objc func addAnnotation() {
        var userLocation = mapDelegate.locationManager.location!.coordinate
        
        mapDelegate.addAnnotation(MapAnnotationModel(
                                    username: "Matheus Kulick",
                                    music: "Musica do metro",
                                    musicAuthor: "Metro Rio",
                                    coordinate: userLocation))
    }
    
}
