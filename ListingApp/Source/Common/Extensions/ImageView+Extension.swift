//
//  ImageView+Extension.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import UIKit
import DownloadImage

extension UIImageView {

    func setImage(from url: URL) -> URLSessionDataTask? {

        if let cached = ImageDownloader.shared.imageCache.object(
            forKey: url as NSURL
        ) as? UIImage {
            self.image = cached
            return nil
        }
        let task = ImageDownloader.shared.downloadImage(with: url, imageView: self)
        return task
    }
}
