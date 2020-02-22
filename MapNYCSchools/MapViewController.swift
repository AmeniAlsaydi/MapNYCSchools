//
//  ViewController.swift
//  MapNYCSchools
//
//  Created by Amy Alsaydi on 2/21/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private var locationSession = CoreLocationSession()
    
    var schools = [School]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
       // mapView.delegate = self
        
        getSchools()
         
       
    }
    
    private func getSchools() {
        apiClient.getSchools { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error getting schools: \(appError)")
            case .success(let schools):
                self?.schools = schools
                DispatchQueue.main.async {
                    self?.loadMapAnnotations()
                }
            }
        }
    }
    
    private func makeSchoolAnnotation() -> [MKPointAnnotation] {
        var annotations = [MKPointAnnotation]()
        
        // using a loop
        for school in schools {
            let annotation = MKPointAnnotation()
            annotation.title = school.school_name
            let latitude = Double(school.latitude) ?? 0 // not the right way to handle this!! FIX
            let longitude = Double(school.longitude) ?? 0
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude , longitude: longitude)
            annotations.append(annotation)
        }
        
        // using .map
        
        return annotations
    }
    
    private func loadMapAnnotations() {
        let annotations = makeSchoolAnnotation()
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
    }
    
}

//extension MapViewController: MKMapViewDelegate {
//
//}
