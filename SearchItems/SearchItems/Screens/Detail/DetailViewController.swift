//
//  DetailViewController.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var interactor: DetailInteractorProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    var itemQuery: ItemQuery? { get set }
    
    func displayViewModel(_ viewModel: DetailViewModel)
    func displayError(_ error: String)
}

class DetailViewController: UITableViewController {
    var itemQuery: ItemQuery?
    var interactor: DetailInteractorProtocol?
    var router: DetailRouterProtocol?
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        if let itemQuery = itemQuery {
            interactor?.doLoadItem(itemQuery)
        }
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: HeaderDetailTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: HeaderDetailTableViewCell.identifier)
        tableView.register(UINib(nibName: AddressDetailTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: AddressDetailTableViewCell.identifier)
    }
    
    private func setup() {
        let detailViewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        let worker = DetailWorker()
        detailViewController.interactor = interactor
        detailViewController.router = router
        interactor.presenter = presenter
        interactor .worker = worker
        presenter.detailViewController = detailViewController
        router.viewController = detailViewController
    }
}

extension DetailViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.viewModel, let cell = viewModel.getTableViewCell(indexPath, tableView) else {
            return UITableViewCell()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetailViewController: DetailViewProtocol {
    func displayViewModel(_ viewModel: DetailViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
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

extension UIViewController {
    static var identifier: String {
        return "\(self)"
    }
}
