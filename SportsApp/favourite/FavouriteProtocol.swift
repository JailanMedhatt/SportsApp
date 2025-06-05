//
//  FavouriteProtocol.swift
//  SportsApp
//
//  Created by Jailan Medhat on 03/06/2025.
//
import CoreData
protocol FavouriteProtocol {
    func getLeagues(leagues : [[LeagueDataModel]]? , headers : [String])
}
