//
//  MT_CalculateDistanceTests.swift
//  MT-CalculateDistanceTests
//
//  Created by mohammad takbiri on 6/12/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import XCTest
@testable import MT_CalculateDistance


class MT_CalculateDistanceTests: XCTestCase {
    
    func testSort(){
        
        var customers = [Customers]()
        let customer1 = Customers(dict: ["latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"])
        let customer2 = Customers(dict: ["latitude": "51.92893", "user_id": 1, "name": "Alice Cahill", "longitude": "-10.27699"])
        customers = [customer1!,customer2!]
        
        let filtered = SortCustomer.sortCustomers(customers: customers)
        
        var unsortedCustomer = [Customers]()
        let uCustomer1 = Customers(dict: ["latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"])
        let uCustomer2 = Customers(dict: ["latitude": "51.92893", "user_id": 1, "name": "Alice Cahill", "longitude": "-10.27699"])
        unsortedCustomer = [uCustomer1!,uCustomer2!]
        
        XCTAssertEqual(filtered, unsortedCustomer)
        
    }
    
}
