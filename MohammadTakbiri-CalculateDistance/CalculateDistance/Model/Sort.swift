//
//  Sort.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/12/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

class SortCustomer { // sort the customers in Ascending format
    
    static func sortCustomers(customers: [Customers]) -> [Customers]{
        
        let sortedArray = customers.sorted {
            $0.user_id < $1.user_id
        }

        return sortedArray        
    }
    
}
