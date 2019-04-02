//
//  ViewController.swift
//  GPSSpeedProblem
//
//  Created by Sander van Tulden on 21/02/2019.
//  Copyright © 2019 Sander van Tulden. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, LocationHelperDelegate {
    
    @IBOutlet weak var currentSpeedLabel: SpeedLabel!
    let currentSpeedDefaultString = "-- km/u"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationHelper.sharedInstance.delegate = self
    }

    @IBAction func startUpdatingLocationsButtonTap(_ sender: UIButton) {
        LocationHelper.sharedInstance.startLocating()
    }
    
    @IBAction func stopUpdatingLocationsButtonTap(_ sender: UIButton) {
        LocationHelper.sharedInstance.stopLocating()
        
        currentSpeedLabel.text = currentSpeedDefaultString
    }
    
    func locationsUpdated(locations: [CLLocation]) {
        guard let firstLocation = locations.first, firstLocation.speed != -1 else {
            currentSpeedLabel.text = currentSpeedDefaultString
            
            return
        }
        
        currentSpeedLabel.updateWithSpeed(speed: firstLocation.speed)
    }
}

