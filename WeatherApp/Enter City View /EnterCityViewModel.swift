//
//  EnterCityViewModel.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit


protocol NavigateDelegate : AnyObject{
    func navigateToNextScreen()
}

class EnterCityViewModel {

    var showHideCompletionHandler: ((_ isShow : Bool) -> Void)?
    var gotoListScreenCompletionHandler: (() -> Void)?
    var showErrorAlertMessage: ((_ message:String) -> Void)?

    var cityName = ""
    var weatherReport : GetWeatherReport?
    
    weak var delegate : NavigateDelegate?
    init() {
        
    }

    func fetchWeatherReportFromCityName(cityName:String) {
        
        self.cityName = cityName
        if let completionhandler = self.showHideCompletionHandler {
            completionhandler(true)
        }
        
        let url = URL(string: "\(Constants.BaseURL)q=\(cityName)&appid=\(Constants.AppId)&units=metric&_=1650566508868")
        URLSession.shared.request(url: url, expecting: GetWeatherReport.self) { result in
            if let completionhandler = self.showHideCompletionHandler {
                completionhandler(false)
            }


            switch result {
            case .success(let weatherReport):
                self.weatherReport = weatherReport
                
                if let code = self.weatherReport?.cod, code == "200", self.weatherReport?.list?.count ?? 0 > 0 {
                    
                    self.delegate?.navigateToNextScreen()
                }else {
                    print(self.weatherReport?.message)
                    if let completionhandler = self.showErrorAlertMessage {
                        completionhandler("Something went wrong, please try again!")
                    }

                }
                

            case .failure(let error):
                print(error.localizedDescription)
                if let completionhandler = self.showErrorAlertMessage {
                    completionhandler(error.localizedDescription)
                }


            }
            

        }
        
    }
}

