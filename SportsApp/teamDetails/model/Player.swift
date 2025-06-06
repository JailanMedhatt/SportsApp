//
//  Player.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 06/06/2025.
//

struct Player: Decodable {
    let playerName: String?
    let playerType: String?
    let playerImage: String?
    
    enum CodingKeys: String, CodingKey {
        case playerName = "player_name"
        case playerType = "player_type"
        case playerImage = "player_image"
    }
}
