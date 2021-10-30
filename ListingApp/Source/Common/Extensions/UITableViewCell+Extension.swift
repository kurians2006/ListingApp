//
//  UITableViewCell+Extension.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import UIKit

extension UITableViewCell {

    /// Class name as cell identifier string
    class var identifier: String { return String(describing: self) }

    /// Initialize xib using Class name
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
}
