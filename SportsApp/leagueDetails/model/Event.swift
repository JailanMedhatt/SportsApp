//
//  Event.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 04/06/2025.
//

struct Event: Decodable {
    
    let eventDate: String?
    let eventTime: String?
    let eventFinalResult: String?
    let leagueName: String?
    let leagueKey: Int?
    
    let homeTeam: String?
    let homeTeamKey: Int?
    let homeTeamLogo: String?
    let awayTeam: String?
    let awayTeamKey: Int?
    let awayTeamLogo: String?
    
    let firstPlayer: String?
    let firstPlayerKey: Int?
    let firstPlayerLogo: String?
    let secondPlayer: String?
    let secondPlayerKey: Int?
    let secondPlayerLogo: String?
    
    enum CodingKeys: String, CodingKey {
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventFinalResult = "event_final_result"
        case leagueName = "league_name"
        case leagueKey = "league_key"

        case homeTeam = "event_home_team"
        case homeTeamKey = "home_team_key"
        case homeTeamLogo = "home_team_logo"
        case awayTeam = "event_away_team"
        case awayTeamKey = "away_team_key"
        case awayTeamLogo = "away_team_logo"
        
       
        case firstPlayer = "event_first_player"
        case firstPlayerKey = "first_player_key"
        case firstPlayerLogo = "first_player_logo"
        case secondPlayer = "event_second_player"
        case secondPlayerKey = "second_player_key"
        case secondPlayerLogo = "second_player_logo"
    }

    
    var participant1Name: String {
            return homeTeam ?? firstPlayer ?? "Unknown"
        }
        
        var participant1Logo: String? {
            return homeTeamLogo ?? firstPlayerLogo
        }
        
        var participant1Key: Int? {
            return homeTeamKey ?? firstPlayerKey
        }
        
        var participant2Name: String {
            return awayTeam ?? secondPlayer ?? "Unknown"
        }
        
        var participant2Logo: String? {
            return awayTeamLogo ?? secondPlayerLogo
        }
        
        var participant2Key: Int? {
            return awayTeamKey ?? secondPlayerKey
        }
    
}
