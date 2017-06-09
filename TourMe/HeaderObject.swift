//
//  HeaderObject.swift
//  TourMe
//
//  Created by Elizabeth Petrov on 6/8/17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import Foundation


class HeaderObject
{
    var id: String!
    var collegeTitle: String = ""
    var collegeSubtitle: String = ""
    var collegeImageURL: String = ""
    var collegeEditorial: String = ""
    
    init(id: String, collegeTitle: String, collegeSubtitle: String, collegeImageURL: String, collegeEditorial: String)
    {
        self.id = id
        self.collegeTitle = collegeTitle
        self.collegeSubtitle = collegeSubtitle
        self.collegeImageURL = collegeImageURL
        self.collegeEditorial = collegeEditorial
    }
}
