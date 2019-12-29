//
//  DarkSkyService.swift
//  RESTful Skelton
//
//  Created by Rajendran Eshwaran on 12/27/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

enum NetworkError : Error{
    case urlError
    case requestError
    case dataError
    case decodeError
    
}
//sample url: https://api.darksky.net/forecast/0123456789abcdef9876543210fedcba/42.3601,-71.0589

class DarkSkyService{
    
    let hostName = "https://api.darksky.net/forecast/"
    let appkey = "8b9d50ba3d44a7d54d8aa6c084e76957/"
    
    
    func DarkSkyWeatherDataFetch(lat: Float , lon : Float , completion: @escaping (Result<DarkSkyWeather ,NetworkError >)-> Void){
        
        
        let urlString = hostName + appkey + "\(lat),\(lon)"
        guard let url = URL(string: urlString) else { return }
        print(url)
        let dataTask = URLSession.shared.dataTask(with: url) {data , response , error in
        
            guard let jsonData = data else {completion(.failure(NetworkError.dataError)); return}
            
            do{
                
                let decoder = JSONDecoder()
                let decoreResponse = try decoder.decode(DarkSkyWeather.self, from: jsonData)
                
                completion(.success(decoreResponse))
                
            }
            catch{
                completion(.failure(NetworkError.decodeError))
            }
            
        }
        dataTask.resume()
    }
}
