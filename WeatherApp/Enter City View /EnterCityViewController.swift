//
//  EnterCityViewController.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class EnterCityViewController: BaseViewController {
    
    @IBOutlet weak var buttonLookUp: UIButton!
    @IBOutlet weak var textFieldEnterCityName: UITextField!
    
    let viewModel = EnterCityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.viewModelHandler()
        
    }
    
    
    func viewModelHandler() {
        
        self.viewModel.delegate = self
        self.viewModel.showHideCompletionHandler = { isShow in
            
            if isShow {
                Utility.showLoading()
            } else {
                Utility.hideLoading()
            }
        }
        
        self.viewModel.showErrorAlertMessage = { message in
            self.presentMessage(message)
        }
        
    }
    
    @IBAction func onTapLookupButtonAction(_ sender: UIButton) {
        
        guard let text = self.textFieldEnterCityName.text, text != "" else {
            self.presentMessage("Please enter city name!")
            return
        }
        
        self.viewModel.fetchWeatherReportFromCityName(cityName: text)
        
    }
    
}


extension EnterCityViewController : NavigateDelegate {
    
    func navigateToNextScreen() {
        
        let cityWeatherListViewController = CityWeatherListViewController.storyboardInstance(StoryboardName: .Main)
        cityWeatherListViewController.selectedCityWeather =  self.viewModel.weatherReport
        cityWeatherListViewController.cityName = self.viewModel.cityName + ", \(self.viewModel.weatherReport?.list?.first?.sys?.country ?? "")"
        self.navigationController?.pushViewController(cityWeatherListViewController, animated: false)
    }
}
