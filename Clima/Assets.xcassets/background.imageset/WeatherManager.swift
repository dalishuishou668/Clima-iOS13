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
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //start task
            task.resume()
            
            
        }
    }
    
    func handle(data:Data?, response:URLResponse?, error:Error?){
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            //print(dataString)
        }
        
    }
    
}
