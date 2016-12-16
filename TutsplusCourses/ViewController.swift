//
//  ViewController.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 16/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var fakeRides : FakeRides?
    var annotations = [Ride : MKAnnotation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        fakeRides = FakeRides()
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(vienna.coordinate, 7_500, 7_500), animated: false)
        
        fakeRides?.rides.forEach { (ride) in
            let annotation = MKPointAnnotation()
            annotation.coordinate = ride.location.coordinate
            annotation.title = ride.driver.name
            
            annotations[ride] = annotation
            mapView.addAnnotation(annotation)
        }
    }
    
    
    @IBAction func scheduleBirthdayNotification(_ sender: Any) {
        let randomDelay = Double(arc4random_uniform(10))
        let people = ["Maria", "Sarah", "Cornelia"]
        let person = people[Int(arc4random_uniform(UInt32(people.count)))]
        let imageUrl = Bundle.main.url(forResource: person, withExtension: "jpg")
        let title = "\(person) has her birthday today!"
        let subtitle = "What a great surprise"
        let body = "Go ahead and congratulate her to that special day."
        
        
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

extension ViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView : MKAnnotationView
        
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: "rides") {
            annotationView = view
        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "rides")
        }
        
        let ride = annotations.filter { (_, a) in
            return a.title! == annotation.title!
            }.first!.key
        
        annotationView.image = ride.image
        
        return annotationView
    }
}
