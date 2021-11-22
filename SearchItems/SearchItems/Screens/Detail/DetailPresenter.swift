//
//  DetailPresenter.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var detailViewController: DetailViewProtocol? { get set }
    
    func presentItemDetail(_ itemQuery: ItemQuery)
    func presentError(_ error: Error)
}

class DetailPresenter: DetailPresenterProtocol {
    weak var detailViewController: DetailViewProtocol?
    
    func presentItemDetail(_ itemQuery: ItemQuery) {
        let address = DetailViewModel.Address(stateName: itemQuery.address.stateName,
                                              cityName: itemQuery.address.cityName)
        let attributes = itemQuery.attributes.map {
            DetailViewModel.Attributes(id: $0.id,
                                       valueName: $0.valueName ?? String(),
                                       name: $0.name ?? String())
        }
        let viewModel = DetailViewModel(id: itemQuery.id,
                                        title: itemQuery.title,
                                        price: itemQuery.price,
                                        imageURL: itemQuery.thumbnail,
                                        currency: itemQuery.currencyId,
                                        availableQuantity: itemQuery.availableQuantity,
                                        soldQuantity: itemQuery.soldQuantity,
                                        address: address,
                                        acceptsMercadopago: itemQuery.acceptsMercadopago,
                                        attributes: attributes)
        detailViewController?.displayViewModel(viewModel)
    }
    
    func presentError(_ error: Error) {
        detailViewController?.displayError(error.localizedDescription)
    }
}
