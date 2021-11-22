//
//  HomeRouter.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
    var viewController: HomeViewController? { get set }
    
    func goToDetailItem(_ itemQuery: ItemQuery?)
}

class HomeRouter: HomeRouterProtocol {
    weak var viewController: HomeViewController?
    
    func goToDetailItem(_ itemQuery: ItemQuery?) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {
            return
        }
        detailViewController.itemQuery = itemQuery
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
