//
//  FinderTableViewCell.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import UIKit

class FinderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    func configureCell(customer: Customers) {
        
        self.userIdLabel.text = "UserID: \(customer.user_id)"
        self.userNameLabel.text = customer.name
        
        self.selectionStyle = .none
        
    }
    
    
}
