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
            completion(.notRequired())
        case let .some(location):
            completion(.success(with: location))
        }
    }
    
    // Confirmation
    
    // Execution
    func handle(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        completion(INRequestRideIntentResponse(code: .failureRequiringAppLaunchNoServiceInArea, userActivity: .none))
    }
}




