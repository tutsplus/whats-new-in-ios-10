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
