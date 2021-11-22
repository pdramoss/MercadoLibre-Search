//
//  HomeInteractor.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    var worker: HomeWorkerProtocol? { get set }
    
    func doLoadData(_ query: String)
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    var worker: HomeWorkerProtocol?
    
    func doLoadData(_ query: String) {
        worker?.fetchSearchQuery(query, completion: { [weak self] (response) in
            switch response {
            case let .success(searchQuery):
                self?.presenter?.presentAllItems(searchQuery)
            case let .failure(error):
                self?.presenter?.presentError(error: error)
            }
        })
    }
}
