//
//  WeatherManager.swift
//  Clima
//
//  Created by Yong Liu on 7/31/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ba90a1348e2804052118e1f3aad2c859&units=metric"
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        //print(urlString)
    }
    
}
