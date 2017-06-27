//
//  HomeDetailViewController.swift
//  TourMe
//
//  Created by Antoine Bellanger on 09.06.17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    @IBOutlet var collegeImageView: UIImageView!
    @IBOutlet var collegeTitleLabel: UILabel!
    @IBOutlet var collegeSubtitleLabel: UILabel!
    @IBOutlet var collegeEditorialTextView: UITextView!
    
    var college: HeaderObject!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let checkedUrl = URL(string: college.collegeImageURL) {
            collegeImageView.contentMode = .scaleAspectFill
            downloadImage(url: checkedUrl, imageView: collegeImageView)
        }
        
        collegeTitleLabel.text = college.collegeTitle
        collegeSubtitleLabel.text = college.collegeSubtitle
        collegeEditorialTextView.text = college.collegeEditorial
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
