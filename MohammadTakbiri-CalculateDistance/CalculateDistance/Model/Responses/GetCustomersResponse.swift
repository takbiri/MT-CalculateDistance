//
//  GetPeoples.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

struct GetCustomersResponse { // handle received file json.
    
    let customers: [Customers]
    
    init(json: Any) throws {
        guard let array = json as? [[String: Any]] else { throw NetworkingError.someError } // if json have any problem, we whould handle an error.
        
        var customers = [Customers]()
        for item in array {
            guard let customer = Customers(dict: item) else { continue }
            customers.append(customer)
        }
        self.customers = customers
    }
    
}
