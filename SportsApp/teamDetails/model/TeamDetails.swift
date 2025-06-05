



struct TeamDetails: Decodable {
    let teamName: String?
    let teamLogo: String?
    let players: [Player]?
    let coaches: [Coach]?
    
    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case players = "players"
        case coaches = "coaches"
    }
}



