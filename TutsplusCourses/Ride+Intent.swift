//
//  Ride+Intent.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import Intents

public extension Ride {
    public var rideIntentVehicle : INRideVehicle {
        let vehicle = INRideVehicle()
        vehicle.location = location
        vehicle.manufacturer = "Awesome Car"
        vehicle.registrationPlate = "W 123456A"
        vehicle.mapAnnotationImage = image.inImage
        return vehicle
    }
}
