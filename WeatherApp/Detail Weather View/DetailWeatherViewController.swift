//
//  DetailWeatherViewController.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class DetailWeatherViewController: BaseViewController {

    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelFeelsLike: UILabel!
    @IBOutlet weak var labelClouds: UILabel!
    @IBOutlet weak var labelCloudDescription: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelWind: UILabel!
    var cityName = ""
    var selectedList : List?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupData()
        self.title = self.cityName
    }
    
    func setupData()  {
        guard let list = self.selectedList else { return  }
        
        self.labelFeelsLike.text = "Feels Like - \( list.main?.getFeelsLikeCelcius ?? "")°"
        self.labelTemp.text = " \( list.main?.getTempCelcius ?? "")°"
        self.labelClouds.text = list.weather?.first?.main ?? ""
        self.labelCloudDescription.text = list.weather?.first?.description ?? ""
        self.labelPressure.text = "Pressure - \( list.main?.pressure ?? 0)"
        self.labelHumidity.text = "Humidity - \( list.main?.humidity ?? 0)"
        self.labelWind.text = "Wind - \( list.wind?.speed ?? 0) m/s"

    }

}
