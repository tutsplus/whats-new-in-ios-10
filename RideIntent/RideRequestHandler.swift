//
//  RideRequestHandler.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import Foundation
import Intents

class RideRequestHandler : NSObject, INRequestRideIntentHandling {
    let fakeRides : FakeRides
    
    init(fakeRides: FakeRides) {
        self.fakeRides = fakeRides
    }
    
    // Resolution
    func resolvePickupLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        switch intent.pickupLocation {
        case .none:
            completion(.needsValue())
        case let .some(location):
            completion(.success(with: location))
        }
    }
    
    func resolveDropOffLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        switch intent.dropOffLocation {
        case .none:
            completion(.needsValue())
        case let .some(location):
            completion(.success(with: location))
        }
    }
    
    func resolvePartySize(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INIntegerResolutionResult) -> Void) {
        switch intent.partySize {
        case .none:
            completion(.needsValue())
        case let .some(people) where people <= 4:
            completion(.success(with: people))
        default:
            completion(.unsupported())
        }
    }
    
    // Confirmation
    func confirm(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        let responseCode : INRequestRideIntentResponseCode
        
        switch intent.pickupLocation! {
        case let location where fakeRides.pickupWithinRange(location.location!):
            responseCode = .ready
        default:
            responseCode = .failureRequiringAppLaunchNoServiceInArea
        }
        
        let response = INRequestRideIntentResponse(code: responseCode, userActivity: .none)
        completion(response)
    }
    
    // Execution
    func handle(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        guard let pickup = intent.pickupLocation?.location, let dropoff = intent.dropOffLocation?.location else {
            let response = INRequestRideIntentResponse(code: .failure, userActivity: .none)
            completion(response)
            return
        }
        
        let response : INRequestRideIntentResponse
        if let ride = fakeRides.requestRide(pickup: pickup, dropoff: dropoff) {
            let status = INRideStatus()
            status.rideIdentifier = ride.driver.name
            status.phase = .confirmed
            status.vehicle = ride.rideIntentVehicle
            status.driver = ride.driver.rideIntentDriver
            status.estimatedPickupDate = Date(timeIntervalSinceNow: 7 * 60)
            status.pickupLocation = intent.pickupLocation
            status.dropOffLocation = intent.dropOffLocation
            
            response = INRequestRideIntentResponse(code: .success, userActivity: .none)
            response.rideStatus = status
        } else {
            response = INRequestRideIntentResponse(code: .failureRequiringAppLaunchNoServiceInArea, userActivity: .none)
        }
        
        completion(response)
    }
}




