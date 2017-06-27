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



class HomeScreenTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var colleges = [HeaderObject]()
    private var collegeRef: DatabaseReference = Database.database().reference().child("homeScreenFeatures")
    private var collegeRefHandle: DatabaseHandle?
    var howManyDisplayed = 10
    
    //-------------------------------------------------------------
    // array to display in tableview (will later hold the database)
    var allHeaders = [HeaderObject]()
    //-------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        queryColleges()
    }
    
    //===============================//
    // TABLE VIEW DELEGATE FUNCTIONS //
    //===============================//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //-------------------------------------------------------------
        // just return how many things are in the database
        return colleges.count
        //-------------------------------------------------------------
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //-------------------------------------------------------------
        // Grab each cell displayed in the tableview
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeatureTableViewCell
        //-------------------------------------------------------------
        
        //-------------------------------------------------------------
        // Customize the cell (at index indexPath.row)
        cell.titleLabel.text = colleges[indexPath.row].collegeTitle
        cell.subtitleLabel.text = colleges[indexPath.row].collegeSubtitle
        if let checkedUrl = URL(string: colleges[indexPath.row].collegeImageURL) {
            cell.backgroundImage.contentMode = .scaleAspectFill
            downloadImage(url: checkedUrl, imageView: cell.backgroundImage)
        }
        //-------------------------------------------------------------
        
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //-------------------------------------------------------------
        // Grab the cell that was tapped on, in order to change it
        // however you want
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeatureTableViewCell
        //-------------------------------------------------------------
        
        let currentCollege = colleges[indexPath.row]
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
 
    //===============================//
    // FIREBASE QUERYING //
    //===============================//
    
    func queryColleges() {
        collegeRefHandle = collegeRef.queryLimited(toFirst: 10).observe(.childAdded, with: { (snapshot) -> Void in
            
            let collegeData = snapshot.value as! Dictionary<String, AnyObject>
            let id = snapshot.key
            print(collegeData, id)
            if let collegeTitle = collegeData["title"] as! String!, let collegeSubtitle = collegeData["Subtitle"] as! String!, let collegeImageURL = collegeData["photoURL"] as! String!, let collegeEditorial = collegeData["editorial"] as! String! {
                print("Appending colleges")
                self.colleges.append(HeaderObject(id: id, collegeTitle: collegeTitle, collegeSubtitle: collegeSubtitle, collegeImageURL: collegeImageURL, collegeEditorial: collegeEditorial))
                self.tableView.reloadData()
            } else {
                print("Could not decode data.")
            }
            
        })
    }
    

    //===============================//
    // DOWNLOAD IMAGE ASNYCHRONOUSLY //
    //===============================//
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL, imageView: UIImageView) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    //===============================//
    // NAVIGATION //
    //===============================//

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCollegeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! HomeDetailViewController
                destinationViewController.college = colleges[indexPath.row]
            }
        }
    }
    
}
