//
//  GetCustomers.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/12/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

class GetCustomers {
    
    static func get(completion: @escaping ([Customers]) ->Void) {
        
        guard let url = URL(string: "https://s3.amazonaws.com/intercom-take-home-test/customers.txt") else {return}
        DownloadFile.downloadFileWithURL(url: url) { (file) in
            
            do {
                // convert the downloaded file content's to an array of strings.
                let data = try String(contentsOfFile: file, encoding: .utf8)
                let stringsArray = data.components(separatedBy: .newlines)
                
                // send stringsArray object to ConvertToJsonArray class for converting the object to jsonArray
                ConvertToJsonArray.convertStringArrayToJsonArray(stringArray: stringsArray) { (response) in
                    completion(response.customers) // send back an array of customers json.
                }
                
                
            } catch {
                print(error)
            }
            
        }
        
    }
    
}
