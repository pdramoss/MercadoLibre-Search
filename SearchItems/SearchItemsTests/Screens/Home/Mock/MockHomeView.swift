//
//  MockHomeView.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 20/11/21.
//

import XCTest
@testable import SearchItems

class MockHomeView: HomeViewProtocol {
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    var displayItemsCalled: Bool = false
    var displayErrorCalled: Bool = false
    var displayDetailCalled: Bool = false
    
    func displayItems(_ viewModel: HomeViewModel) {
        displayItemsCalled = true
    }
    
    func displayError(_ error: String) {
        displayErrorCalled = true
    }
    
    func displayDetail(_ itemQuery: ItemQuery) {
        displayDetailCalled = true
    }
}
