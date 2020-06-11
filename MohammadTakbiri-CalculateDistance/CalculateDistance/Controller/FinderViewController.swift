//
//  FinderViewController.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import UIKit

class FinderViewController: UIViewController {

    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var customers: [Customers]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://s3.amazonaws.com/intercom-take-home-test/customers.txt") else {return}
        DownloadFile.downloadFileWithURL(url: url) { (file) in
            
            
            
        }
        
        
        let path = CustomersFileAddress.getAddress()
        do {
            let data = try String(contentsOfFile: path.absoluteString, encoding: .utf8)
            let myStrings = data.components(separatedBy: .newlines)
            
            let response = ConvertToJsonArray.convertStringArrayToJsonArray(stringArray: myStrings) { (response) in
                
                let arc = Double(self.distanceTextField.text!)
                FilterCustomers.filterCustomersWith(customers: response.customers, arc: arc ?? 0) { (filteredCustomers) in
                    print("number of filtered is \(filteredCustomers.count)")
                    self.customers = filteredCustomers
                }
                
            }
            
            
        } catch {
            print(error)
        }
        
    }

}

extension FinderViewController: UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FinderTableViewCell
        cell.configureCell(customer: self.customers[indexPath.row])
        return cell
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let arc = Double(textField.text!)
        FilterCustomers.filterCustomersWith(customers: self.customers, arc: arc ?? 0) { (filteredCustomers) in
            print("number of filtered is \(filteredCustomers.count)")
            self.customers = filteredCustomers
        }
        
        return true
    }
    
}
