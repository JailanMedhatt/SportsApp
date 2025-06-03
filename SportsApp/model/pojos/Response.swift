//
//  Response.swift
//  SportsApp
//
//  Created by Jailan Medhat on 02/06/2025.
//

import Foundation
class Response : Decodable{
    var success: Int?
    var result : [LeagueDataModel]?
}
