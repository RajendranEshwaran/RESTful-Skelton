//
//  CurrentNewsService.swift
//  RESTful Skelton
//
//  Created by gomathi saminathan on 1/5/20.
//  Copyright © 2020 Rajendran Eshwaran. All rights reserved.
//

import Foundation

enum CurrentServiceError : Error {
    case urlError
    case dataNotFound
    case decodeError
}

//https://api.currentsapi.services/v1/latest-news?language=en&apiKey=svXWs75LqIWLiEKkVud_8yDWfzzLaVdXCJYWzbThDdKDTp3h

class CurrentNewsService
{
    let hostName = "https://api.currentsapi.services/"
    let pathName = "v1/"
    let optionalQuery = "latest-news?language=en&"
    let apiKey = "svXWs75LqIWLiEKkVud_8yDWfzzLaVdXCJYWzbThDdKDTp3h"
    
     func CurrentNewsFetch(completion:@escaping (Result<CurrentNews , CurrentServiceError>) -> Void)
    {
        let urlString = hostName + pathName + optionalQuery + "apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { completion(.failure(CurrentServiceError.urlError)); return }
        let dataTask = URLSession.shared.dataTask(with: url) {data , response ,error in
            
            do{
                guard let jsonData = data else {completion(.failure(CurrentServiceError.dataNotFound)); return}
                
                let decoder = JSONDecoder()
                let decodeResponse = try decoder.decode(CurrentNews.self, from: jsonData)
                completion(.success(decodeResponse))
            }
            catch{
                completion(.failure(CurrentServiceError.decodeError))
            }
        }
        dataTask.resume()
    }
    
}
