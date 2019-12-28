//
//  DarkSkyModel.swift
//  RESTful Skelton
//
//  Created by Rajendran Eshwaran on 12/27/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

struct DarkSkyWeather :Decodable {
    
    let latitude : Double
    let longitude : Double
    let timezone : String
    let currently : Currently
    
    private enum CodingKeys: String ,CodingKey{
        case latitude , longitude ,timezone , currently
    }
}

struct Currently : Decodable {
    
    let time : Date
    let summary : String
    let icon : String
    let nearestStormDistance : Int
    let precipIntensity : Double
    let precipType : String
    let temperature : Double
    let apparentTemperature : Double
    let dewPoint : Double
    let humidity : Double
    let pressure : Double
    let windSpeed : Double
    let windGust : Double
    let cloudCover : Double
    let uvIndex : Int
    let visibility: Float
    let ozone : Float
    
    private enum CodingKeys: String , CodingKey{
        
        case time ,summary ,icon ,nearestStormDistance ,precipIntensity ,precipType ,temperature ,apparentTemperature ,dewPoint ,humidity ,pressure ,windSpeed ,windGust ,cloudCover ,uvIndex ,visibility ,ozone
        
    }
}

struct Hourly : Decodable{
    
    let summary : String
    let icon : String
    let data : [Data]
    private enum CodingKeys: String , CodingKey{
        case summary , icon , data
    }
}

struct Data: Decodable {
    let time : Date
    let summary : String
    let icon : String
    let precipIntensity : Double
    let precipType : String
    let temperature : Double
    let apparentTemperature : Double
    let dewPoint : Double
    let humidity : Double
    let pressure : Double
    let windSpeed : Double
    let windGust : Double
    let windBearing : Int
    let cloudCover : Double
    let uvIndex : Int
    let visibility: Float
    let ozone : Float
    
    private enum CodingKeys: String , CodingKey{
        
        case time ,summary ,icon ,precipIntensity ,precipType ,temperature ,apparentTemperature ,dewPoint ,humidity ,pressure ,windSpeed ,windGust ,cloudCover ,windBearing ,uvIndex ,visibility ,ozone
        
    }
}
