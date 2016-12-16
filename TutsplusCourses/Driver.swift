//
//  Driver.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit

public enum Rating : Int {
    case oneStar = 1, twoStars, threeStars, fourStars, fiveStars
    
    var toString : String {
        return String(repeating: "⭐️", count: rawValue)
    }
}

public struct Driver {
    public let name : String
    public let image : UIImage
    public let rating : Rating
}
//
//  Driver.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 16/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import Foundation
