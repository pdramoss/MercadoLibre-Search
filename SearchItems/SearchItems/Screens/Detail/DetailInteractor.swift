//
//  DetailInteractor.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

protocol DetailInteractorProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    var worker: DetailWorkerProtocol? { get set }
    
    func doLoadItem(_ itemQuery: ItemQuery)
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    var worker: DetailWorkerProtocol?
    
    func doLoadItem(_ itemQuery: ItemQuery) {
        presenter?.presentItemDetail(itemQuery)
    }
}
