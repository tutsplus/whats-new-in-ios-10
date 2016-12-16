//
//  UIImage+Intent.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 02/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit
import Intents

public extension UIImage {
    var inImage : INImage {
        return INImage(imageData: UIImagePNGRepresentation(self)!)
    }
}
