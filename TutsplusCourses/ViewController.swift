//
//  ViewController.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 16/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateHapticFeedback(_ sender: Any) {
        //        let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        //        feedbackGenerator.prepare()
        //
        //        feedbackGenerator.impactOccurred()
        
        //        let feedbackGenerator = UINotificationFeedbackGenerator()
        //        feedbackGenerator.notificationOccurred(.error)
        
        let feedbackGenerator = UISelectionFeedbackGenerator()
        feedbackGenerator.selectionChanged()
    }
}

