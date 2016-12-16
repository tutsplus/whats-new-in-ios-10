//
//  FakeRides.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit
import CoreLocation

let vienna = CLLocation(latitude: 48.210033, longitude: 16.363449)
let drivers = [("Sarah", 2), ("Martin", 1), ("Wolfgang", 2), ("Maria", 3), ("Cornelia", 5)]
let vehicles = ["cruise", "schoolbus", "submarine", "taxi", "plane"]

public class FakeRides {
    let rides : [Ride]
    
    public init() {
        
        self.rides = zip(drivers, vehicles).map { (person, ride) in
            let driver = Driver(name: person.0, image: UIImage(named: "person", in: Bundle.main, compatibleWith: .none)!, rating: Rating(rawValue: person.1)!)
            
            return Ride(driver: driver,
                        image: UIImage(named: ride, in: Bundle.main, compatibleWith: .none)!,
                        location: vienna.randomLocation(within: 2_500))
        }
    }
    
    public func closestRide(location: CLLocation) -> Ride? {
        return rides.filter { $0.availableForPickup }.sorted { $0.location.distance(from: location) < $1.location.distance(from: location) }.first
    }
    
    public func requestRide(pickup: CLLocation, dropoff: CLLocation) -> Ride? {
        guard let ride = closestRide(location: pickup) else { return .none }
        
        if ride.requestRide(pickup: pickup, dropoff: dropoff) {
            return ride
        }
        
        return .none
    }
    
    public func pickupWithinRange(_ location: CLLocation) -> Bool {
        if let closestRide = closestRide(location: location) {
            return closestRide.location.distance(from: location) < 5_000
        }
        
        return false
    }
}
