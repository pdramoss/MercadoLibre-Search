//
//  MockDetailView.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 21/11/21.
//

import XCTest
@testable import SearchItems

class MockDetailView: DetailViewProtocol {
    var interactor: DetailInteractorProtocol?
    var router: DetailRouterProtocol?
    var itemQuery: ItemQuery?
    var displayViewModelCalled: Bool = false
    var displayErrorCalled: Bool = false
    
    func displayViewModel(_ viewModel: DetailViewModel) {
        displayViewModelCalled = true
    }
    
    func displayError(_ error: String) {
        displayErrorCalled = true
    }
}
