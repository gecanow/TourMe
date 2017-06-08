//
//  ChatTableViewController.swift
//  TourMe
//
//  Created by Elizabeth Petrov on 6/7/17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import UIKit
import Firebase

class FeatureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
}



class HomeScreenTableViewController: UITableViewController {
    
 //   var items = [HeaderObject]
    var ref: DatabaseReference!
    var recentPostQuery: DatabaseReference!
    var howManyDisplayed = 10
    
    //-------------------------------------------------------------
    // array to display in tableview (will later hold the database)
    var allHeaders = [HeaderObject]()
    //-------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //===============================//
    // TABLE VIEW DELEGATE FUNCTIONS //
    //===============================//
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //-------------------------------------------------------------
        // just return how many things are in the database
        return allHeaders.count
        //-------------------------------------------------------------
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //-------------------------------------------------------------
        // Grab each cell displayed in the tableview
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! FeatureTableViewCell
        //-------------------------------------------------------------
        
        //-------------------------------------------------------------
        // Customize the cell (at index indexPath.row)
        cell.titleLabel.text = allHeaders[indexPath.row].titleText
        cell.subtitleLabel.text = allHeaders[indexPath.row].subtitleText
        //cell.backgroundImage = allHeaders[indexPath.row].imageURL
        //-------------------------------------------------------------
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //-------------------------------------------------------------
        // Grab the cell that was tapped on, in order to change it
        // however you want
        _ = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! FeatureTableViewCell
        //-------------------------------------------------------------
        
        //-------------------------------------------------------------
        // Use the index to filter the next view controller,
        // and get whatever information you want from the chosen cell
        _ = allHeaders[indexPath.row].college
        //-------------------------------------------------------------
    }
 
    
    

    

    
}
