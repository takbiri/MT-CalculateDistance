//
//  FilterCustomers.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

class FilterCustomers{
    
    static func filterCustomersWith(customers: [Customers], arc: Double, completion: @escaping ([Customers]) ->Void){
        
        let rad = M_PI / 180
        let radius:Double = 6371 // earth radius in kilometers
        let officeLat = 53.339428
        let officeLng = -6.257664
        
        var filtered = [Customers]()
        customers.forEach { (customer) in
            
            let distance = acos(sin(customer.lat.doubleValue * rad) * sin(officeLat * rad) + cos(customer.lat.doubleValue * rad) * cos(officeLat * rad) * cos(customer.lng.doubleValue * rad - officeLng * rad)) * radius
            
            if  distance < arc {
                filtered.append(customer)
            }
        }
        
        completion(filtered)
        
    }
    
    
    //    function getDistance($lat1, $lon1, $lat2, $lon2) {
    //    $rad = M_PI / 180;
    //    $radius = 6371; //earth radius in kilometers
    //    return acos(sin($lat2 * $rad) * sin($lat1 * $rad) + cos($lat2 * $rad) * cos($lat1 * $rad) * cos($lon2 * $rad - $lon1 * $rad)) * $radius; //result in Kilometers
    //    }
}
