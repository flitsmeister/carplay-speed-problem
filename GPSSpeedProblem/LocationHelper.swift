//
//  LocationHelper.swift
//  GPSSpeedProblem
//
//  Created by Sander van Tulden on 21/02/2019.
//  Copyright © 2019 Sander van Tulden. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationHelperDelegate {
    func locationsUpdated(locations: [CLLocation])
}

class LocationHelper: NSObject, CLLocationManagerDelegate {
    static let sharedInstance = LocationHelper()
    
    let locationManager = CLLocationManager()
    
    var delegate: LocationHelperDelegate?
    
    override private init() {
        super.init()
        
        // These settings mimick the settings we have in our Flitsmeister app
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.activityType = .automotiveNavigation
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
    }
    
    func startLocating() {
        locationManager.startUpdatingLocation()
    }
    
    func stopLocating() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.locationsUpdated(locations: locations)
    }
}
