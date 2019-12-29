//
//  ViewController.swift
//  RESTful Skelton
//
//  Created by Rajendran Eshwaran on 12/26/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var openWeatherDetail :[CurrentLocalWeather] = []
    let openweatherObject = OpenWeatherService()

    var daryWeatherDetail : [DarkSkyWeather] = []
    let darkskyservice = DarkSkyService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
      /*  openweatherObject.OpenWeatherCurrentDataFetch(lat: 35.0, lon: 139.0){[weak self] result in
            switch(result){
            case .success(let success):
                self?.openWeatherDetail = [success]
                print(" open weather current pressure: \(success.main.pressure)")
                print(" open weather current humidity: \(success.main.humidity)")
                print(" open weather current temperature: \(success.main.temp)")
                break
            case .failure(let failure):
                print(failure)
                break
            default:
                print("UnSupported Functionality")
            }
        }*/
        
        
        
        darkskyservice.DarkSkyWeatherDataFetch(lat: 37.8267, lon: -122.4233){ [weak self] result in
            
            switch(result){
            case .success(let success):
                self?.daryWeatherDetail = [success]
                print(success.hourly)
                break
            case .failure(let failure):
                print(failure)
                break
            }
            
        }
        
    }


}

