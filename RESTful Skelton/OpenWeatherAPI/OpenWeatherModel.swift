//
//  OpenWeatherModel.swift
//  RESTful Skelton
//
//  Created by Rajendran Eshwaran on 12/26/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

struct CurrentLocalWeather: Decodable {
    let base: String
    let clouds: Clouds
    let cod: Int
    let coord: Coord
    let dt: Int
    let id: Int
    let main: Main
    let name: String
    let sys: Sys
    let visibility: Int
    let weather: [Weather]
    let wind: Wind

    private enum CodingKeys: String, CodingKey{
        case base = "base"
        case clouds
        case cod = "cod"
        case coord
        case dt = "dt"
        case id  = "id"
        case main
        case name = "name"
        case sys
        case visibility = "visibility"
        case weather
        case wind
    }
}
struct Clouds: Decodable {
    let all: Int
    private enum CodingKeys: String, CodingKey{
        case all
    }
}
struct Coord: Decodable {
    let lat: Double
    let lon: Double
    private enum CodingKeys: String, CodingKey{
        case lat
        case lon
    }
}
struct Main :Decodable{
    let humidity: Int
    let pressure: Int
    let temp: Double
    let temp_max: Double
    let temp_min: Double
    
    enum CodingKeys: String, CodingKey {
        case humidity = "humidity"
        case pressure = "pressure"
        case temp
        case temp_max
        case temp_min
    }
}

struct Sys: Decodable {
    let id: Int
    let type: Int
    let country: String
    let sunrise: UInt64
    let sunset: UInt64

    private enum CodingKeys: String, CodingKey{
        case country
        case id
        case sunrise
        case sunset
        case type
    }
}
struct Weather: Decodable {
    let description: String
    let icon: String
    let id: Int
    let main: String

    private enum CodingKeys: String, CodingKey{
        case id
        case main
        case icon
        case description
    }
}
struct Wind: Decodable {
    let deg: Int
    let speed: Double

    private enum CodingKeys: String, CodingKey{
        case deg
        case speed

    }
}
