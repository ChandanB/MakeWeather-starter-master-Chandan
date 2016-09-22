//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 4/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import YWeatherAPI

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        YWeatherAPI.sharedManager().todaysForecast(forLocation: "San Francisco",
        success: { (result: [AnyHashable: Any]?) in print(result) },
        
        failure: { (response: Any?, error: Error?) in print(error) })
        
    }


}

