//
//  LeagueDetailsPresenter.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 04/06/2025.
//

import Foundation
protocol LeagueDetailsPresenterProtocol {
    var ref: LeagueDetailsProtocol! { get set }
    var league: LeagueDataModel? { get set }
    func fetchLeaguesDetails()
}


class LeagueDetailsPresenter : LeagueDetailsPresenterProtocol{
    
    private  var upcomingEvents: [Event]?
    private  var latestEvents: [Event]?
    private var teams: [Team]?
    
    var ref : LeagueDetailsProtocol!
    var league : LeagueDataModel?
    
    init(ref: LeagueDetailsProtocol, league: LeagueDataModel) {
        self.ref = ref
        self.league = league
    }
    
    func fetchLeaguesDetails(){
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchUpcomingEvents{
            dispatchGroup.leave()
        }
        
        
        dispatchGroup.enter()
        fetchLatestEvents{
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.extractTeams()
            
            if var latestEvents = self.latestEvents {
                
                if latestEvents.count > 15 {
                    self.latestEvents = Array(latestEvents[0..<15])
                }
            }
            
            if (teams!.isEmpty){teams = nil}
            
            self.ref.setLeagueDetails(upcomingEvents: upcomingEvents, latestEvents: latestEvents, teams: teams)
          
        }

                
    }
    
    
  private  func fetchUpcomingEvents(completion: @escaping () -> Void){
      print("the start date is : \(Date().lastYear())")
      print("the end date is :\(Date())")
      print(league?.sport?.lowercased() ?? "")
      print ("the kei is : \(league?.league_key ?? 0)")
      NetworkManager.shared.fetchEvents(for:league?.sport?.lowercased() ?? "", leagueId: league?.league_key ?? 0, fromDate: Date().toString(),toDate: Date().nextYear().toString() ) { [weak self] events in

            
          self?.upcomingEvents = events
          print("\(events?.count) counts of events")
            completion()
            
        }
    }
    
    private func fetchLatestEvents(completion: @escaping () -> Void){
        
        NetworkManager.shared.fetchEvents(for:league?.sport?.lowercased() ?? "", leagueId: league?.league_key ?? 0, fromDate:Date().lastYear().toString() ,toDate:Date().toString() ) { [weak self] events in
            
            
            
            
            self?.latestEvents = events
            
            completion()
            
        }
    }
    
    private func extractTeams(/*from events: [Event]*/) {
        var allTeams = Set<Team>()
        
        let events = upcomingEvents ?? [] + (latestEvents ?? [])
        
        for event in events {
            let participant = Team(teamKey: event.participant1Key,
                                   teamName: event.participant1Name,
                                   teamLogo: event.participant1Logo)
            
            allTeams.insert(participant)
        }
        
        self.teams = Array(allTeams)
    }
        
        
        
  
        
    
}


//            guard let self = self else { return }
//            self.extractTeams(from: events ?? [])
//            self.ref?.setLeagueDetails(upcomingMatches: events ?? [], pastMatches: [], teams: Array(self.teams))



//private func extractTeams(/*from events: [Event]*/) {
//    var allTeams = Set<Team>()
//    let events = upcomingEvents ?? [] + latestEvents
//    
//    // Include existing teams
////            for team in self.teams {
////                allTeams.insert(team)
////            }
//    
//    // Add new teams from events
//    for event in events {
//        let participant = Team(teamKey: event.participant1Key,
//                               teamName: event.participant1Name,
//                               teamLogo: event.participant1Logo)
//        //            let awayTeam = Team(teamKey: event.awayTeamKey,
//        //                               teamName: event.awayTeam,
//        //                               teamLogo: event.awayTeamLogo)
//        
//        allTeams.insert(participant)
//        //            allTeams.insert(awayTeam)
//    }
//    
//    self.teams = Array(allTeams)
//}
