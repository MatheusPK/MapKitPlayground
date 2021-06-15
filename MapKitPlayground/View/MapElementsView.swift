//
//  MapElementsView.swift
//  MapKitPlayground
//
//  Created by Matheus Kulick on 15/06/21.
//

import Foundation
import UIKit


class MapElementsView: UIViewController {
    
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
        button.backgroundColor = .green
        button.setTitle("fazer marcacao", for: .normal)
        return button
    }()
    
    func addUIButtons(_ vc: UIViewController) {
        
        vc.view.addSubview(myLocationButton)
        vc.view.addSubview(annotationButton)
        
        myLocationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLocationButton.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            myLocationButton.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor, constant: 100)
        ])
        
        annotationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            annotationButton.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            annotationButton.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
        
    }
    
}
