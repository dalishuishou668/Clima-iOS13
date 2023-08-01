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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // create url
        if let url = URL(string: urlString){
            
            // create url session object that perform networking
            let session = URLSession(configuration: .default)
            
            // give task(completed task will trigger completionhandler)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            //start task
            task.resume()
            
            
        }
    }
    
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        }catch{
            print(error)
        }
            
    }
    
    
    
}
