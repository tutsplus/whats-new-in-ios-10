//
//  Ride.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit
import CoreLocation

public enum RideState {
    case available
    case driving
    case collecting
    case completed
}

public class Ride {
    public let driver : Driver
    public let image : UIImage
    public var state : RideState
    public var location : CLLocation
    
    var availableForPickup : Bool {
        return state == .available
    }
    
    init(driver: Driver, image: UIImage, location: CLLocation) {
        self.driver = driver
        self.image = image
        self.location = location
        self.state = .available
    }
    
    func requestRide(pickup: CLLocation, dropoff: CLLocation) -> Bool {
        if !availableForPickup {
            return false
        }
        
        state = .collecting
        return true
    }
}

extension Ride : Hashable {
    public var hashValue: Int {
        return image.hashValue
    }
}

public func == (lhs: Ride, rhs: Ride) -> Bool {
    return lhs.image == rhs.image
}
