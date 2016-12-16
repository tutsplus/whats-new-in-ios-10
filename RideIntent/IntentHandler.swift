//
//  IntentHandler.swift
//  RideIntent
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import Intents

let fakeRides = FakeRides()

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any? {
        if intent is INRequestRideIntent {
            return RideRequestHandler(fakeRides: fakeRides)
        }
        
        return .none
    }
}

