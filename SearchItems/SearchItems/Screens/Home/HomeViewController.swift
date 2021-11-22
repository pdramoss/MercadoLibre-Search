//
//  HomeViewController.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func displayItems(_ viewModel: HomeViewModel)
    func displayError(_ error: String)
}

class HomeViewController: UITableViewController {
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    var list: [HomeViewModel.Item] = []
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Language.HomeScreen.title.localizableKey
        setup()
        setupSearchController()
        tableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setup() {
        let homeViewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let worker = HomeWorker()
        homeViewController.interactor = interactor
        homeViewController.router = router
        interactor.presenter = presenter
        interactor .worker = worker
        presenter.homeViewController = homeViewController
        router.viewController = homeViewController
    }
    
    private func setupSearchController() {
        searchController.searchBar.placeholder = Language.HomeScreen.searchBarText.localizableKey
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false
        navigationItem.searchController = searchController
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(list[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.goToDetailItem(list[indexPath.row].itemQuery)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayItems(_ viewModel: HomeViewModel) {
        list = viewModel.list
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                                       at: .top,
                                       animated: true)
        }
        
    }
    
    func displayError(_ error: String) {
        let alert = UIAlertController(title: Language.CommonScreen.error.localizableKey,
                                      message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Language.CommonScreen.cancel.localizableKey,
                                      style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        if text.isEmpty {
            list = []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        // TO DO: Autocompletar
        Logger.info("TEXT: \(text)")
    }
}
extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        if text.count >= 3 {
            interactor?.doLoadData(text)
        }
    }
}
