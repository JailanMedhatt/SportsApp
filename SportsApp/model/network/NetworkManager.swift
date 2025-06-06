//
//  NetworkManager.swift
//  SportsApp
//
//  Created by Jailan Medhat on 02/06/2025.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func fetchLeagues(sport: String, handler: @escaping ([LeagueDataModel]?) -> Void)
    func fetchEvents(for sport: String, leagueId: Int, fromDate: String, toDate: String, completion: @escaping ([Event]?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager() // Singleton instance
    private init() {} // Prevent external instantiation

    private let apiKey = "d06add75ece9b225e54e58803ce35a8e30f820ed35894f1bc4bdad31c4577fdc"
    private let baseUrl = "https://apiv2.allsportsapi.com/"
    
    func fetchLeagues(sport: String, handler: @escaping ([LeagueDataModel]?) -> Void) {
        let parameters: [String: String] = [
            "APIkey": apiKey,
            "met": "Leagues"
        ]
        
        AF.request(baseUrl + "/\(sport)/", parameters: parameters).responseData { response in
            switch response.result {
            case .success(let value):
                do {
                    let response = try JSONDecoder().decode(Response<LeagueDataModel>.self, from: value)
                    handler(response.result)
                } catch {
                    print("Decoding error: \(error.localizedDescription)")
                    handler(nil)
                }
            case .failure(let error):
                print("Network error: \(error)")
                handler(nil)
            }
        }
    }
    
    func fetchEvents(for sport: String, leagueId: Int, fromDate: String, toDate: String, completion: @escaping ([Event]?) -> Void) {
        let urlString = baseUrl + "/\(sport)/"
        let parameters: Parameters = [
            "met": "Fixtures",
            "APIkey": apiKey,
            "from": fromDate,
            "to": toDate,
            "leagueId": leagueId
        ]
        
        AF.request(urlString, parameters: parameters).responseDecodable(of: Response<Event>.self) { response in
            switch response.result {
            case .success(let apiResponse):
                completion(apiResponse.result)
            case .failure(let error):
                print("Error fetching events: \(error)")
                completion(nil)
            }
        }
<<<<<<< HEAD
    
    static func fetchTeamDetails(for sport: String, teamId: Int, completion: @escaping ([TeamDetails]?) -> Void) {
             let urlString = baseUrl + "/\(sport)/"
             let parameters: Parameters = [
                 "met": "Teams",
                 "APIkey": apiKey,
                 "teamId": teamId
             ]

             AF.request(urlString, parameters: parameters).responseDecodable(of: Response<TeamDetails>.self) { response in
                 switch response.result {
                 case .success(let apiResponse):
                     completion(apiResponse.result)
                 case .failure(let error):
                     print("Error fetching events: \(error)")
                     completion(nil)
                 }
             }
         }
    
    
 
=======
    }
>>>>>>> development
}
