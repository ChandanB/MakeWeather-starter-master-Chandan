//
//  TableViewCell.swift
//  MakeWeather-starter
//
//  Created by Chandan Brown on 9/22/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import YWeatherAPI

class TableViewCell: UITableViewCell {
    
    var forecastData: [[String: Any]] = []
    
    @IBOutlet weak var forecastSummaryLabel: UILabel!
    @IBOutlet weak var forecastLowestTemp: UILabel!
    @IBOutlet weak var forecastHighestTemp: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
       
        YWeatherAPI.sharedManager().fiveDayForecast(forLocation: "San Francisco",success: { (result: [AnyHashable: Any]?) in print(result)
            
            let fiveDayForecasrsArray = result!["fiveDayForecasts"] as! [[String: Any]]
            self.forecastData = fiveDayForecasrsArray

            }, failure: { (response: Any?, error: Error?) in print(error) })
        
        forecastLowestTemp.text = "Low"
        forecastHighestTemp.text = "High"
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
