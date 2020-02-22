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
    
    
    
    var schools = [School]()
    
    @IBOutlet weak var mapView: MKMapView!
    private var locationSession = CoreLocationSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSchools()
       
    }
    
    private func getSchools() {
        apiClient.getSchools { (result) in
            switch result {
            case .failure(let appError):
                print("error getting schools: \(appError)")
            case .success(let schools):
                self.schools = schools
            }
        }
    }


}

