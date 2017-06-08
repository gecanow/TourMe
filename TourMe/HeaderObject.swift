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
    var titleText: String = ""
    var subtitleText: String = ""
    var imageURL: String = ""
    var college: String = ""
    
    init(tT: String, sT: String, iURL: String, c: String)
    {
        titleText = tT
        subtitleText = sT
        imageURL = iURL
        college = c
    }
}
