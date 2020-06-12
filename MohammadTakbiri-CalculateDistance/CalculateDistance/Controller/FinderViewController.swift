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
    
    var filteredCustomers = [Customers]()
    var sourceCustomers = [Customers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GetCustomers.get { (customers) in
            self.filteredCustomers = SortCustomer.sortCustomers(customers: customers) // sort received customers
            self.sourceCustomers = self.filteredCustomers
            self.tableView.reloadData()
        }
        
    }
    
}

extension FinderViewController: UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCustomers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FinderTableViewCell
        cell.configureCell(customer: self.filteredCustomers[indexPath.row]) // configure custom cell with filtered data
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    // update data based on distance that user entered in distanceTextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let arc = Double(textField.text!)
        FilterCustomers.filterCustomersWith(customers: self.sourceCustomers, arc: arc ?? 0) { (filteredCustomers) in
            self.filteredCustomers = filteredCustomers // update filteredCustomers array and then update our UITableView
            print(self.filteredCustomers)
            self.tableView.reloadData()
        }
        
        textField.resignFirstResponder() // close Keyboard
        
        return true
    }
    
}
