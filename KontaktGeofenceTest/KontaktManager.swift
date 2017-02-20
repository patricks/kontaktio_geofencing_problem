//
//  KontaktManager.swift
//  KontaktGeofenceTest
//
//  Created by Patrick Steiner on 20.02.17.
//  Copyright © 2017 Mopius. All rights reserved.
//

import Foundation
import KontaktSDK

class KontaktManager: NSObject {
    let beaconManager = KTKBeaconManager()
    
    func setup() {
        // Set API Key
        Kontakt.setAPIKey("<YOUR-API-KEY>")
        
        // Initiate Beacon Manager
        beaconManager.delegate = self
        beaconManager.requestLocationAlwaysAuthorization()
    }
    
    fileprivate func setupRegion() {
        // Region
        let proximityUUID = UUID(uuidString: "<YOUR-BEACON-UUID>")
        let beaconRegion = KTKBeaconRegion(proximityUUID: proximityUUID!, identifier: "region")
        
        // Start Monitoring
        beaconManager.startMonitoring(for: beaconRegion)
    }
}

extension KontaktManager: KTKBeaconManagerDelegate {
    func beaconManager(_ manager: KTKBeaconManager, didDetermineState state: CLRegionState, for region: KTKBeaconRegion) {
        print(#function)
        
        /**
         * The app crashes here with the following error:
         * libswiftFoundation.dylib`static Foundation.UUID._unconditionallyBridgeFromObjectiveC (Swift.Optional<__ObjC.NSUUID>) -> Foundation.UUID:
         */
        
        print("KTK didDetermineState region: \(region.proximityUUID.uuidString)")
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didEnter region: KTKBeaconRegion) {
        print(#function)
        
        print("KTK didEnterRegion: \(region.proximityUUID.uuidString)")
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didExitRegion region: KTKBeaconRegion) {
        print(#function)
        
        print("KTK didExitRegion: \(region.proximityUUID.uuidString)")
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didChangeLocationAuthorizationStatus status: CLAuthorizationStatus) {
        print(#function)
        
        if status == .authorizedAlways {
            setupRegion()
        }
    }
}
