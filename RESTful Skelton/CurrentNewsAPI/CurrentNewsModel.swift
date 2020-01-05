//
//  CurrentNewsModel.swift
//  RESTful Skelton
//
//  Created by gomathi saminathan on 1/5/20.
//  Copyright © 2020 Rajendran Eshwaran. All rights reserved.
//

import Foundation

struct CurrentNews
{
    let status : String
    let news : [News]
}

extension CurrentNews : Decodable{
    
    enum CodingKeys : String , CodingKey
    {
        case status , news
    }
}

struct News{
    
    let id : String
    let title : String
    let description : String
    let url : String
    let author : String
    let image : String
    let language : String
    let published : String
    let category : [String]

}

extension News : Decodable{
    
    enum CodingKeys : String , CodingKey {
        case id , title , description , url , author , image , language , published , category
    }
}
