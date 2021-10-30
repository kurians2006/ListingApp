//
//  ListingModel.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import Foundation


// MARK: - List

struct Lists: BaseResult {
    let list: [ListingList]?

    enum CodingKeys: String, CodingKey {
        case list = "results"
    }
}


// MARK: - Result
struct ListingList: Decodable {
    let uid: String?
    let createdAt: String?
    let price: String?
    let name: String?
    let imageUrls: [String]?
    let imageUrlsThumbnails: [String]?
    let imageIds: [String]?

    enum CodingKeys: String, CodingKey {
        case uid
        case createdAt = "created_at"
        case price
        case name
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
        case imageIds = "image_ids"
    }
}

