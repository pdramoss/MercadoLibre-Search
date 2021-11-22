//
//  HomePresenter.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import UIKit
import Foundation

protocol HomePresenterProtocol: AnyObject {
    var homeViewController: HomeViewProtocol? { get set }
    
    func presentAllItems(_ searchQUery: SearchQuery)
    func presentError(error: Error)
}

class HomePresenter: HomePresenterProtocol {
    weak var homeViewController: HomeViewProtocol?
    
    func presentAllItems(_ searchQuery: SearchQuery) {
        let list = searchQuery.results.map {
            HomeViewModel.Item(id: $0.id,
                               title: $0.title,
                               price: $0.price,
                               imageURL: $0.thumbnail,
                               currency: $0.currencyId,
                               itemQuery: $0)
        }
        let viewModel = HomeViewModel(siteId: searchQuery.siteId,
                                      list: list,
                                      query: searchQuery.query)
        homeViewController?.displayItems(viewModel)
    }
    
    func presentError(error: Error) {
        homeViewController?.displayError(error.localizedDescription)
    }
}
