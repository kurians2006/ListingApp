//
//  UIViewController+Extension.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import Foundation
import UIKit
extension UIViewController {
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        guard let controller = storyboard.instantiateViewController(withIdentifier: identifier) as? T else { return T() }
        return controller
    }
    class func controllerFromStoryboard(_ storyboard: String) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard, bundle: nil), identifier: nameOfClass)
    }
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
}


extension NSObject {
    class var nameOfClass: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}


enum titleType : String {
    case Info = "Info"
    case Warning = "Warning"
    case Error = "Error"
    case Alert = "Alert"
}

extension UIViewController {

    func presentAlert(withTitle title: titleType = .Info, message : String = "") {
        let alertController = UIAlertController(title: title.rawValue , message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        print("Ok button completion handler")
    }
    let CANCELAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: { action in
        print("CANCEL button completion handler")
    })
    alertController.addAction(OKAction)
    alertController.addAction(CANCELAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
