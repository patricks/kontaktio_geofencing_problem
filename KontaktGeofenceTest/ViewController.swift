//
//  ViewController.swift
//  KontaktGeofenceTest
//
//  Created by Patrick Steiner on 20.02.17.
//  Copyright © 2017 Mopius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let kontaktManager = KontaktManager()
    let appleManager = AppleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kontaktManager.setup()
        appleManager.setup()
    }
}
