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
    
    @IBOutlet weak var TimeLabel: UILabel! = {
        let label = UILabel()
        label.text = "HH:MM:SS"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @IBOutlet weak var forecastSummaryLabel: UILabel!
    @IBOutlet weak var forecastLowestTemp: UILabel!
    @IBOutlet weak var forecastHighestTemp: UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    
        addSubview(TimeLabel)
        
        
        //need x,y,width,height anchors
        TimeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        TimeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        TimeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        TimeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        YWeatherAPI.sharedManager().todaysForecast(forLocation: "San Francisco",
        success:{ (result: [AnyHashable: Any]?) in print(result) },
        failure: { (response: Any?, error: Error?) in print(error) })
    }

}
