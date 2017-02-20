//
//  AppleManager.swift
//  KontaktGeofenceTest
//
//  Created by Patrick Steiner on 20.02.17.
//  Copyright © 2017 Mopius. All rights reserved.
//

import Foundation
import CoreLocation

class AppleManager: NSObject {
    
    let locationManager = CLLocationManager()
    
    func setup() {
        // Initiate Core Location Manager
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
    }
    
    fileprivate func setupRegion() {
        // Region
        let location = CLLocationCoordinate2D(latitude: 48.20637, longitude: 14.253638)
        let geofenceRegion = CLCircularRegion(center: location, radius: 50, identifier: "AAA-BBB-CCC")
        
        // Start Monitoring
        locationManager.startMonitoring(for: geofenceRegion)
    }
}

extension AppleManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        print(#function)
        
        print(" didDetermineState region: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print(#function)
        
        print(" didEnterRegion: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print(#function)
        
        print(" didExitRegion: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        
        if status == .authorizedAlways {
            setupRegion()
        }
    }
}
