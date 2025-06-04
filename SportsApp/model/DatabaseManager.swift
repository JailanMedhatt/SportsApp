//
//  DatabaseManager.swift
//  SportsApp
//
//  Created by Jailan Medhat on 03/06/2025.
//
import UIKit
import CoreData
class DatabaseManager{
   static func addLeague( leagueObj : LeagueDataModel ){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Leagues", in: context)!
        let league = NSManagedObject(entity: entity, insertInto: context)
        league.setValue(leagueObj.league_name, forKey: "league_name")
        league.setValue(leagueObj.league_key, forKey: "league_key")
        league.setValue(leagueObj.sport, forKey: "sport")
        league.setValue(leagueObj.league_logo, forKey: "league_logo")
      
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
            
        }
    }
  static  func getAllLeagues() -> [NSManagedObject]{
        var leaguesNS : [NSManagedObject] = []
      //  var leagues : [LeagueDataModel] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        do {
            leaguesNS = try context.fetch(request)
            
            
        }
        catch {
            print("Fetching Failed")
        }
        return leaguesNS
    }
  static  func deleteLeague(leagueKey : Int){
        var Leagues : [NSManagedObject] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        request.predicate = NSPredicate(format: "league_key == %d", leagueKey)
        do {
            Leagues = try context.fetch(request)
            for item in Leagues{
                print("  \(item.value(forKey: "league_key")) xx")
                context.delete(item)
            }
            try context.save()
            
        }
        catch {
            print("Fetching Failed")
        }
        
    }
    static func isLeagueExist(leagueKey : Int) -> Bool{
        var isExist : Bool = false
        var Leagues : [NSManagedObject] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        request.predicate = NSPredicate(format: "league_key == %d", leagueKey)
        do {
            Leagues = try context.fetch(request)
            if Leagues.count > 0 {
                isExist = true
            }
        }
        catch {
            print("Fetching Failed")
        }
        return isExist
    }
}
