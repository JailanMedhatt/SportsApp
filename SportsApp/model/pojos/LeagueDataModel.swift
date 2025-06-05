//
//  LeagueDataModel.swift
//  SportsApp
//
//  Created by Jailan Medhat on 02/06/2025.
//

import Foundation

class LeagueDataModel: Decodable {
    var league_key : Int?
    var league_name : String?
    var isFavorite : Bool?
    var league_logo : String?
    var sport: String?
    private enum CodingKeys: String, CodingKey {
            case league_key
            case league_name
            case league_logo
        }
    init(league_key: Int?, league_name: String?, league_logo: String?, sport: String?) {
          self.league_key = league_key
          self.league_name = league_name
          self.league_logo = league_logo
          self.sport = sport
          // self.isFavorite is not initialized here
      }

}
