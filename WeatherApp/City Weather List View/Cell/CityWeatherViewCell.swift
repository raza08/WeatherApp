//
//  CityWeatherViewCell.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class CityWeatherViewCell: UITableViewCell {
    @IBOutlet weak var labelWeather :UILabel!
    @IBOutlet weak var labelWind :UILabel!
    @IBOutlet weak var labelTemp :UILabel!

    var list:List?{
        didSet {
            guard let list = list else { return  }
            self.labelWeather.text = list.weather?.first?.main ?? ""
            self.labelWind.text = "Wind - \( list.wind?.speed ?? 0) m/s"
            self.labelTemp.text = " Temp - \( list.main?.getTempCelcius ?? "")°"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
