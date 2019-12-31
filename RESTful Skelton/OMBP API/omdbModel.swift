//
//  omdbModel.swift
//  RESTful Skelton
//
//  Created by gomathi saminathan on 12/30/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

struct OMDBData {
    
    let Title : String
    let Year : String
    let Rated : String
    let Released : String
    let Genre : String
    let Director : String
    let Writer : String
    let Actors : String
    let Plot : String
    let Language : String
    let Country : String
    let Awards : String
    let Poster : String
    let Metascore : String
    let imdbRating : String
    let imdbVotes : String
    let imdbID : String
    let type : String //
    let DVD : String
    let BoxOffice : String
    let Production : String
    let Website : String
    let Response : String
    //let Ratings : ratings
}

struct ratings
{
    let Source : String
    let Value : String
}

extension OMDBData : Decodable{
    
    enum CodingKeys: String , CodingKey {
        case Title  ,Rated ,Released ,Genre , Director , Writer , Actors , Plot , Language , Country , Awards , Poster , Metascore = "Metascore" , imdbRating = "imdbRating" , imdbVotes ,imdbID , type = "Type" ,DVD , BoxOffice, Production , Website ,Response //,Ratings
    }
    
//    enum RatingKeys : String , CodingKey {
//        case Source , Value
//    }
    
    init(from decode: Decoder) throws{
        
        let container = try decode.container(keyedBy: CodingKeys.self)
        
        Title = try container.decode(String.self, forKey: .Title)
        Year  = try container.decode(String.self, forKey: .Year)
        Rated = try container.decode(String.self, forKey: .Rated)
        Released = try container.decode(String.self, forKey: .Released)
        Genre = try container.decode(String.self, forKey: .Genre)
        Director = try container.decode(String.self, forKey: .Director)
        Writer = try container.decode(String.self, forKey: .Writer)
        Actors = try container.decode(String.self, forKey: .Actors)
        Plot = try container.decode(String.self, forKey: .Plot)
        Language = try container.decode(String.self, forKey: .Language)
        Country = try container.decode(String.self, forKey: .Country)
        Awards = try container.decode(String.self, forKey: .Awards)
        Poster = try container.decode(String.self, forKey: .Poster)
        Metascore  = try container.decode(String.self, forKey: .Metascore)
        imdbRating = try container.decode(String.self, forKey: .imdbRating)
        imdbVotes = try container.decode(String.self, forKey: .imdbVotes)
        imdbID = try container.decode(String.self, forKey: .Poster)
        type = try container.decode(String.self, forKey: .type)
        DVD = try container.decode(String.self, forKey: .DVD)
        BoxOffice = try container.decode(String.self, forKey: .BoxOffice)
        Production = try container.decode(String.self, forKey: .Production)
        Website = try container.decode(String.self, forKey: .Website)
        Response = try container.decode(String.self, forKey: .Response)
    
        
    }
}

    

