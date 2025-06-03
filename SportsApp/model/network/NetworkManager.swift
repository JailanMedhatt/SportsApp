//
//  NetworkManager.swift
//  SportsApp
//
//  Created by Jailan Medhat on 02/06/2025.
//

import Foundation
import Alamofire
class NetworkManager {
   static let apiKey = "d06add75ece9b225e54e58803ce35a8e30f820ed35894f1bc4bdad31c4577fdc"
 static  let baseUrl = "https://apiv2.allsportsapi.com/"
    static func fetchLeagues(sport : String, handler : @escaping ([LeagueDataModel]?) -> Void){
        let parameters : [String:String] = ["APIkey":apiKey,
                                            "met":"Leagues"]
        AF.request(baseUrl+"/\(sport)/",parameters: parameters).responseData { response in
            switch response.result {
            case .success(let value):
                do {
                    let response = try JSONDecoder().decode(Response.self, from: value )
                    handler(response.result)
                } catch {
                    print(error.localizedDescription)
                    handler(nil)
                }
            case .failure(let error):
                print(error)
                handler(nil)
            }
        }
    }
}
