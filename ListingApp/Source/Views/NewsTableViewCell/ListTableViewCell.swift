//
//  ListTableViewCell.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet private weak var cellContainerView:UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var reporterLabel: UILabel!
    @IBOutlet private weak var publishedOnLabel: UILabel!
    @IBOutlet private weak var thumbnailImageView: UIImageView!

    
    //MARK:-  Let & Var
    private var imageDownLoadTask: URLSessionDataTask?

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.applyCornerRadiusShadow(color: .black, alpha: 0.2, x: 0, y: 3, blur: 20, spread: 0, cornerRadiusValue: 12)
        backgroundColor = UIColor(named: "BGColor")
        cellContainerView.layer.borderColor = UIColor.lightGray.cgColor
        cellContainerView.layer.borderWidth = 0.3
        cellContainerView.layer.applyCornerRadiusShadow(color: .black, alpha: 0.2, x: 0.0, y: 3, blur: 10, spread: 0, cornerRadiusValue: 12)
    }

    override func prepareForReuse() {

        super.prepareForReuse()
        imageDownLoadTask?.cancel()
        imageView?.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {}

    func updateUI(list: ListingList) {

        titleLabel.text = list.name
        reporterLabel.text = "Price: \(list.price ?? "0 AED")"
        publishedOnLabel.text = list.createdAt?.toDateString(.localDate)

        reporterLabel.textColor = UIColor(named: "SubtitleTextColor")
        publishedOnLabel.textColor = UIColor(named: "SubtitleTextColor")
        
        let imageURLString: String? = list.imageUrlsThumbnails?.first

        if let imageURL = imageURLString,
            let url = URL(string: imageURL) {
            imageDownLoadTask = thumbnailImageView?.setImage(from: url)
            layoutIfNeeded()
        }
    }
    
}


