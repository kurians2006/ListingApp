//
//  NetworkManager.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import Foundation
import UIKit

// MARK: - Response

public struct Response<Value> {

    /// The URL request sent to the server
    public let requestURL: URL?

    /// The data returned by the server
    public let data: Data?

    /// Decoded Result
    public let result: Value?

    /// Error received
    public let error: Error?
}



// MARK: - BaseResult
public protocol BaseResult: Decodable {}



// MARK: - NetworkManager

open class NetworkManager {

    static let shared = NetworkManager()
    let session  = URLSession.shared
    
    func start<T: BaseResult>(request: URL, complition: ((Response<T>) -> Void)?) {
        NetworkMonitor.shared.startMonitoring { [unowned self] isConnected in
            if !isConnected{
                DispatchQueue.main.async {
                    UIApplication.shared.windows.first?.rootViewController?.presentAlert(withTitle: .Info, message: "Internet is unstable")
                    
                }
                return
            }
            let dataTask = session.dataTask(
            with: request) { ( data, response, error) in

                if error != nil {
                    print(error!.localizedDescription)
                }

                guard let data = data else { return }

                if let model = try? JSONDecoder().decode(T.self, from: data) {
                    let result = Response(
                        requestURL: request,
                        data: data,
                        result: model,
                        error: error
                    )
                    complition?(result)
                }
            }
            dataTask.resume()
        }
    }
}
