//
//  WeatherManager.swift
//  Clima
//
//  Created by Yong Liu on 7/31/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error:Error)
}

struct WeatherManager{
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ba90a1348e2804052118e1f3aad2c859&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        //print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        // create url
        if let url = URL(string: urlString){
            
            // create url session object that perform networking
            let session = URLSession(configuration: .default)
            
            // give task(completed task will trigger completionhandler)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //start task
            task.resume()
            
            
        }
    }
    
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
            //print(weather.temperatureString)
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
            
    }
    
    
    
    
    
}
