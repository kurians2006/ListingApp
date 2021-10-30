//
//  ViewController.swift
//  ListingApp
//
//  Created by Naeem Paracha on 30/10/2021.
//

import UIKit

class ListingViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel = ListingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activityIndicator.startAnimating()
        viewModel.delegate = self
        viewModel.fetchLists()
        initView()
 
    }


    
    //MARK:- Private Methods
    fileprivate func initView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .white
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = true
        
        tableView.register(ListTableViewCell.nib, forCellReuseIdentifier: ListTableViewCell.identifier)
    }
}

// MARK: - UITableViewDelegate

extension ListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ListingDetailViewController.controllerFromStoryboard("Main")
        controller.list = viewModel.list![indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { fatalError("xib does not exists") }
        cell.updateUI(list: viewModel.list![indexPath.row])
        return cell
    }
}


extension ListingViewController: ListingViewModelDelegate {
    func didFetchList(isSuccessFull: Bool) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
    }
}
