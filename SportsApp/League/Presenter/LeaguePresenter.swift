
class LeaguePresenter {
    
    var ref : LeagueProtocol!
    var sport : String!
    init(ref: LeagueProtocol!, sport : String!  ) {
        self.ref = ref
        self.sport = sport
    }
    func fetchLeagues() {
        NetworkManager.fetchLeagues(sport: self.sport, handler: {[weak self] leagues in self?.ref?.getLeagues(leagues: leagues)})
    }
    
}
