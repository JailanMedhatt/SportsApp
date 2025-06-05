//
//  TeamDetailsPresenter.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 06/06/2025.
//

class TeamDetailsPresenter {
    
    var ref: TeamDeatilsProtocol?
    var teamId: Int?
    var sport : String?
    
    init(ref: TeamDeatilsProtocol, teamId: Int, sport: String) {
        self.ref = ref
        self.teamId = teamId
        self.sport = sport
    }
    
    func getTeamDetails() {
        NetworkManager.fetchTeamDetails(for: sport ?? "", teamId: teamId ?? 0) { [weak self] result in
            self?.ref?.setTeamDetails(teamDetailsArray: result)
        }
    }
}
