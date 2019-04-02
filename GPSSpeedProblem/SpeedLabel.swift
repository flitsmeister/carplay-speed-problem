//
//  SpeedLabel.swift
//  GPSSpeedProblem
//
//  Created by Sander van Tulden on 21/02/2019.
//  Copyright © 2019 Sander van Tulden. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class SpeedLabel: UILabel {
    let measurementFormatter = MeasurementFormatter()
    
    func updateWithSpeed(speed: CLLocationSpeed) {
        let speedMeasurement = Measurement(value: speed, unit: UnitSpeed.metersPerSecond)
        
        measurementFormatter.locale = Locale(identifier: "nl_NL")
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        
        text = measurementFormatter.string(from: speedMeasurement)
    }
}
