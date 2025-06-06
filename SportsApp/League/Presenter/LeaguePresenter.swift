protocol LeaguePresenterProtocol {
    var sport: String? { get set }
    func fetchLeagues()
    func addLeagueToFavorite(league: LeagueDataModel)
    func isLeagueinfav(leagueKey: Int) -> Bool
    func deleteLeagueToFavorite(leagueKey: Int)
}
class LeaguePresenter : LeaguePresenterProtocol{
    
    var ref : LeagueProtocol!
    var sport : String?
    init(ref: LeagueProtocol!, sport : String!  ) {
        self.ref = ref
        self.sport = sport
    }
    func fetchLeagues() {
        NetworkManager.shared.fetchLeagues(sport: self.sport!.lowercased(), handler: {[weak self] leagues in self?.ref?.getLeagues(leagues: leagues)})
    }
    func addLeagueToFavorite(league: LeagueDataModel) {
        DatabaseManager.addLeague(leagueObj: league)
       
    }
    func isLeagueinfav(leagueKey: Int) -> Bool{
        return DatabaseManager.isLeagueExist(leagueKey: leagueKey)
    }
    func deleteLeagueToFavorite(leagueKey: Int) {
        DatabaseManager.deleteLeague(leagueKey: leagueKey)
    }
    
}
