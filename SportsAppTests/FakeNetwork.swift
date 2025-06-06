//
//  FakeNetwork.swift
//  UnitTestingDemo
//
//  Created by Jailan Medhay on 31/05/2025.
//
import Foundation
@testable import SportsApp
class FakeNetwork
{
    var shouldReturnError: Bool
    
   
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
        
        // true value -> error -> offline
        //false value -> sucess -> online
    
    }
    
    enum responsewithError: Error {
        
        case responseError
    }
}



extension FakeNetwork{
    
    func fetchNewData(url : String , completion: @escaping ([LeagueDataModel]? , Error?) -> Void) {
        
        if shouldReturnError
        {
         
            completion(nil,responsewithError.responseError )
        }
        else{
            //shouldReturnError   //false -> online
            let newsArray = [LeagueDataModel]()
            completion(newsArray , nil)
            
            
        }
    }
}
