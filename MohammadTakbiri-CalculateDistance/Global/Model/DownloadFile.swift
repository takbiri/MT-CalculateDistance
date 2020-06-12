//
//  DownloadFile.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class DownloadFile {
    
    private init () {}
    
    static func downloadFileWithURL(url: URL, completion: @escaping (String)->Void){
        
        
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
        
        // create an destination object that have address for saving files that will be download.
        let destination: DownloadRequest.Destination = { _, _ in
            let fileURL = CustomersFileAddress.getAddress()
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        
        
        AF.download(url, to: destination).response { (response) in
            
            SVProgressHUD.dismiss()
            print("response is \(response)")
            guard let fileAddress = response.fileURL?.path else {return}
            completion(fileAddress)
            
        }
        
    }
    
}
