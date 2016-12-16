//
//  CLLocation+Random.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import CoreLocation

public extension CLLocation {
    public func randomLocation(within distance: Double) -> CLLocation {
        srand48(Int(arc4random()))
        
        // This is just an approximation
        let radiusInDegrees = distance * (360.0 / (cos(coordinate.latitude) * 40_075_000.0))
        
        let randomRadius = drand48() * radiusInDegrees
        let randomAngle = drand48() * 2.0 * .pi
        
        let randomLatitude = randomRadius * cos(randomAngle)
        let randomLongitude = randomRadius * sin(randomAngle)
        
        return CLLocation(latitude: coordinate.latitude + randomLatitude, longitude: coordinate.longitude + randomLongitude)
    }
}
