//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Jailan Medhat on 30/05/2025.
//

import XCTest
@testable import SportsApp

final class SportsAppTests: XCTestCase {
    var networkManager : NetworkManagerProtocol!
    override func setUpWithError() throws {
        networkManager = NetworkManager.shared
       
    }

    override func tearDownWithError() throws {

    }

    func testFetchLeagues(){
        let expectation = expectation(description: "Fetch Leagues")
        networkManager.fetchLeagues (sport: "football"){ (result) in
            if(result == nil){
                XCTFail("Nothing returned")
            }
            else{
                XCTAssert(result!.count == 943, "not the correct number of leagues")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        
        
    }
    func testFetchEvents(){
        let expectation = expectation(description: "Fetch Events")
        networkManager.fetchEvents(for: "football",leagueId: 4 ,fromDate: "2024-06-06" ,toDate: "2025-06-06"){ (result) in
            if(result == nil){
                XCTFail("Nothing returned")
            }
            else{
                XCTAssert(result!.count == 269, "not the correct number of events")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

}
