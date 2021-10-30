//
//  ListingViewModel.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import Foundation

// MARK: - ListingViewModelDelegate

protocol ListingViewModelDelegate: AnyObject {
    func didFetchList(isSuccessFull: Bool)
}

// MARK: - ListingViewModel

class ListingViewModel {

    var list: [ListingList]?
    var delegate: ListingViewModelDelegate?

    init() {
    }

    //MARK:- Get Cell Models
    func getCellViewModel(at indexPath: IndexPath) -> ListingList {
        return list![indexPath.row]
    }
    
    func fetchLists() {

        guard let url = Constants.URLForApi() else { return }

        NetworkManager.shared.start(request: url) { [unowned self] (response: Response<Lists>) in

            list = response.result?.list
            delegate?.didFetchList(isSuccessFull: response.error == nil)
        }
    }

}
