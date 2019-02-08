//
//  mapcontrollerViewController.swift
//  Projeto05.02.19
//
//  Created by aluno on 07/02/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit
import MapKit

class mapcontrollerViewController: UIViewController {


    @IBOutlet weak var mapaNaTela: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialLocation = CLLocation(latitude: -8.057307, longitude: -34.872381)
        centerMapOnLocation(location: initialLocation)
        
        let artwork = Artwork(title: "recife antigo",
                              locationName: "recife",
                              discipline: "nao sei",
                              coordinate: CLLocationCoordinate2D(latitude: -8.057307, longitude: -34.872381))
        mapaNaTela.addAnnotation(artwork)
        
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapaNaTela.setRegion(coordinateRegion, animated: true)
    }
        // Do any additional setup after loading the view.
    }

