//
//  Constants.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import Foundation

struct Constants {
    
    //Config and base URL
    static let baseURL = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    static let path = "/default/dynamodb-writer"
    
    static func URLForApi(path: String = "") -> URL? {
        return URL(string: Constants.baseURL + (path.count == 0 ? Constants.path : path) )
    }
}
