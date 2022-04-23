//
//  CityWeatherViewModel.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class CityWeatherViewModel {

    var weatherReport : GetWeatherReport?
    var mainListData = [List]()
    init() {
        
    }
    
    func fetchData(){
        
        for item in self.weatherReport?.list ?? [] {
            self.mainListData.append(item)
        }
        
    }
    
}

enum TBLSection {
    case First
}


struct CityWeather: Hashable {
    var list: List?
}
