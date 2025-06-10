//
//  Coach.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 06/06/2025.
//

struct Coach: Decodable {
    let coachName: String?
    
    enum CodingKeys: String, CodingKey {
        case coachName = "coach_name"
    }
}
