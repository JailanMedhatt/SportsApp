//
//  favPresenter.swift
//  SportsApp
//
//  Created by Jailan Medhat on 03/06/2025.
//

class FavPresenter {
    var ref : FavouriteProtocol!
    var basketballLeagues : [LeagueDataModel] = []
    var footballLeagues : [LeagueDataModel] = []
    var cricketLeagues : [LeagueDataModel] = []
    var tennisLeagues : [LeagueDataModel] = []
    var leaguesArrays : [[LeagueDataModel]] = []
    var headers : [String] = []

    var leagues : [LeagueDataModel] = []
   
    init(ref: FavouriteProtocol! ) {
        self.ref = ref
    }
    func fetchLeagues() {
        leagues = []
        leaguesArrays = []
        headers = []
        let NSleagues = DatabaseManager.getAllLeagues()
    
        for league in NSleagues {
            let leagueDataModel = LeagueDataModel(league_key: league.value(forKey: "league_key") as? Int ?? 0, league_name: league.value(forKey: "league_name") as? String ?? "", league_logo: league.value(forKey: "league_logo") as? String ?? "", sport: league.value(forKey: "sport") as? String ?? "")
            leagues.append(leagueDataModel)
        }
        
        
        adjustHeadersAndArray()
    
        ref?.getLeagues(leagues: leaguesArrays , headers:  headers)
    }
    func deleteLeagueToFavorite(leagueKey: Int) {
        DatabaseManager.deleteLeague(leagueKey: leagueKey)
     
    }
    func adjustHeadersAndArray(){
        basketballLeagues = leagues.filter({$0.sport?.lowercased() == "basketball"})
        footballLeagues = leagues.filter({$0.sport?.lowercased() == "football"})
        cricketLeagues = leagues.filter({$0.sport?.lowercased() == "cricket"})
        tennisLeagues = leagues.filter({$0.sport?.lowercased() == "tennis"})
        if tennisLeagues.count != 0 || !tennisLeagues.isEmpty{
            leaguesArrays.append(tennisLeagues)
            headers.append( "Tennis")
            
        }
        if basketballLeagues.count != 0 || !basketballLeagues.isEmpty {
            leaguesArrays.append(basketballLeagues)
            headers.append( "Basketball")
        }
        if footballLeagues.count != 0  || !footballLeagues.isEmpty{
      
            leaguesArrays.append(footballLeagues)
            headers.append("Football")
        }
        if cricketLeagues.count != 0 || !cricketLeagues.isEmpty {
            leaguesArrays.append(cricketLeagues)
            headers.append( "Cricket")
        }
    }
    
   
}
