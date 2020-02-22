//
//  CoreLocationSession.swift
//  MapNYCSchools
//
//  Created by Amy Alsaydi on 2/22/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import Foundation
import CoreLocation


class CoreLocationSession: NSObject {
    public var locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        startSignificatLocationChanges()
    }
    
    private func startSignificatLocationChanges() {
        if !CLLocationManager.significantLocationChangeMonitoringAvailable() { // a class that returns a bool depending on  significant-change location service is available on the device. - Power saving
            // not availbale on device
            return
        }
        // less aggressive than startUpdatingLocation() in GPS monitor changes
        locationManager.startMonitoringSignificantLocationChanges()
    }
}

extension CoreLocationSession: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("location updated") // works 
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // states of access for location services
        switch status {
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        default:
            break
        }
    }
}
