//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 4/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import YWeatherAPI
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate, UINavigationBarDelegate, UINavigationControllerDelegate{
    
    //Country label is labeled as date label, needs fix
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var lowestTempLabel: UILabel!
    @IBOutlet weak var highestTempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var symbolLabel: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YWeatherAPI.sharedManager().todaysForecast(forLocation: "San Francisco",
        success: { (result: [AnyHashable: Any]?) in print(result) },
        failure: { (response: Any?, error: Error?) in print(error) })
        
            
        dateLabel.text = ""
        summaryLabel.text = ""
        currentTemperatureLabel.text = "Hi!"
        lowestTempLabel.text = "0"
        highestTempLabel.text = "0"
        summaryLabel.isUserInteractionEnabled = true
        cityTextField.text = ""
        cityTextField.placeholder = "Enter City Name"
        cityTextField.delegate = self
        cityTextField.enablesReturnKeyAutomatically = true
    
    }
    
    @IBAction func getLocationAndDisplayData(_ sender: AnyObject) {
        
        YWeatherAPI.sharedManager().todaysForecast(forLocation: cityTextField.text,
        success: { (result: [AnyHashable: Any]?) in
            
            if result != nil {
            self.highestTempLabel.text = result?["highTemperatureForDay"] as? String
            self.lowestTempLabel.text = result?["lowTemperatureForDay"] as? String
            self.summaryLabel.text = result?["shortDescription"] as? String
            self.currentTemperatureLabel.text = result?["region"] as? String
            self.dateLabel.text = result?["country"] as? String
            }
        }, failure: { (response: Any?, error: Error?) in print(error) })
    }
}

