//
//  Driver+Intent.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import Intents

public extension Driver {
    public var rideIntentDriver : INRideDriver {
        return INRideDriver(phoneNumber: "no phone",
                            nameComponents: .none,
                            displayName: name,
                            image: image.inImage,
                            rating: rating.toString)
    }
}
