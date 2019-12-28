//
//  OpenWeatherService.swift
//  RESTful Skelton
//
//  Created by Rajendran Eshwaran on 12/26/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation
enum DataFetchError :Error {
    case InvalidRequest
    case DataNotFound
    case InvalidUrl
    case DecodeError
    case NetworkError
    
}
class OpenWeatherService
{
    let hostName = "https://api.openweathermap.org/data/2.5/"
    let pathName = "weather?"
    let appId = "39ba1f82c2955d8f6ec62e00f8eae491"
    let city = ""
   
    
    func OpenWeatherCurrentDataFetch(lat:Double,lon:Double, completion: @escaping (Result<CurrentLocalWeather,DataFetchError>) -> Void){
        
        // MARK: Fetch weather data base on latitude and longtitude
        let urlString = hostName + pathName + "lat=\(lat)&lon=\(lon)" + "&APPID=\(appId)"
    
        //  MARK: Fetch weather data base on city name
        //let urlString = hostName + pathName + "q=\(city)" + "&APPID=\(appId)"
        
        guard let url = URL(string: urlString) else { fatalError()}
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error  in
            
            guard let jsonData = data else{completion(.failure(DataFetchError.DataNotFound));return}
            
            do{
               let decodeData = JSONDecoder()
                print(jsonData)
                let decodeResponse = try decodeData.decode(CurrentLocalWeather.self, from: jsonData)
                completion(.success(decodeResponse))
            }catch{
                completion(.failure(DataFetchError.DecodeError))
            }
            
        }
        dataTask.resume()
    }

}
