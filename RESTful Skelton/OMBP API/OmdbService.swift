//
//  OmdbService.swift
//  RESTful Skelton
//
//  Created by gomathi saminathan on 12/30/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

// http://www.omdbapi.com/?i=tt3896198&apikey=f0b76fe9

import Foundation

enum OMDBError : Error
{
    case urlError
    case requestError
    case dataError
    case decodeError
}

class OmdbSerivce
{
    
    func FetchomdbMovieData(withUrl:String , completion:@escaping (Result<OMDBData , OMDBError>) -> Void)
    {
    
        let urlString = withUrl
        let url = URL(string: urlString)
        print(url)
        guard let urlRequest = url else {
            fatalError()
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest){data , response , error in
            
            guard let jsonData = data else {completion(.failure(OMDBError.dataError));return}
            
            do{
                
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(OMDBData.self, from: jsonData)
                completion(.success(decodedData))
            }catch{
                completion(.failure(OMDBError.decodeError))
            }
            
            
        }
        dataTask.resume()
    }
}
