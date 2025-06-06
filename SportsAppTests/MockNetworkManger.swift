//
//  MockNetworkManger.swift
//  UnitTestingDemoTests
//
//  Created by Jailan Medhat on 31/05/2025.
//

import XCTest
@testable import SportsApp
final class MockNetworkManger: XCTestCase {
    
    var fakeObjNetwork : FakeNetwork!
    override func setUpWithError() throws {
        fakeObjNetwork = FakeNetwork(shouldReturnError: !(NetworkMonitor.shared.isConnected ?? true))
       
    }

      
      func testMockNetwork() {
          
          fakeObjNetwork.fetchNewData(url: " ") { new , error in
              
              if let error = error {
                  XCTFail("Network dissconnected")
              }
              else{
                  XCTAssertNotNil(new)
              }
          }
      }
    
    
    
  

}
