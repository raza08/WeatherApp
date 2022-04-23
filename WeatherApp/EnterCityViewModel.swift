//
//  EnterCityViewModel.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class EnterCityViewModel {

    var showHideCompletionHandler: ((_ isShow : Bool) -> Void)?
    var gotoListScreenCompletionHandler: (() -> Void)?

    var weatherReport : GetWeatherReport?
    init() {
        
    }

    func fetchWeatherReportFromCityName(cityName:String) {
        
        if let completionhandler = self.showHideCompletionHandler {
            completionhandler(true)
        }
        
        let url = URL(string: "\(Constants.BaseURL)q=\(cityName)&appid=\(Constants.AppId)&_=1650566508868")
        URLSession.shared.request(url: url, expecting: GetWeatherReport.self) { result in
            if let completionhandler = self.showHideCompletionHandler {
                completionhandler(false)
            }


            switch result {
            case .success(let weatherReport):
                self.weatherReport = weatherReport
                if let completionhandler = self.gotoListScreenCompletionHandler {
                    completionhandler()
                }

            case .failure(let error):
                print(error.localizedDescription)

            default:break
                
            }
            

        }
        
    }
}
