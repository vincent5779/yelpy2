//
//  Restaurant.swift
//  Yelpy
//
//  Created by Hew, Vincent on 9/25/21.
//  Copyright © 2021 memo. All rights reserved.
//

import Foundation

class Restaurant {
    
    // Establish properties
    var imageURL: URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: Int
    
    // Complete initializer for Restaurant
    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as! Int
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        mainCategory = Restaurant.getMainCategory(dict: dict)
    }
    
    // Helper function to get First category from restaurant
    static func getMainCategory(dict: [String: Any]) -> String {
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
    }
}
