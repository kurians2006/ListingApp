//
//  ListingDetailViewController.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import Foundation
import UIKit

class ListingDetailViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var articleImage:   UIImageView!
    @IBOutlet weak var byLabel:        UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var content:        UILabel!
    //MARK:- Let & Var
    var list:ListingList?
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListData(list: list)
    }
    func setupListData(list:ListingList?){
        if let listDetails = list {
            content.text         = listDetails.name
            byLabel.text         = "Prrice: \(listDetails.price ?? "0 AED")"
            publishedLabel.text  = listDetails.createdAt?.toDateString(.localDate)
            let imageURLString: String? = listDetails.imageUrls?.first
            if let imageURL = imageURLString,
                let url = URL(string: imageURL) {
                _ = articleImage?.setImage(from: url)
            }
        }
    }
}


