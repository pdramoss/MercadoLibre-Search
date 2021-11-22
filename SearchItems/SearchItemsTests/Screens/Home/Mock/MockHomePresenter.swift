//
//  MockHomePresenter.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 20/11/21.
//

import XCTest
@testable import SearchItems

class MockHomePresenter: HomePresenterProtocol {
    var homeViewController: HomeViewProtocol?
    var presentAllItemsCalled: Bool = false
    var presentErrorCalled: Bool = false
    var presentDetailCalled: Bool = false
    
    func presentAllItems(_ searchQUery: SearchQuery) {
        presentAllItemsCalled = true
    }
    
    func presentError(error: Error) {
        presentErrorCalled = true
    }
    
    func presentDetail(_ item: ItemQuery) {
        presentDetailCalled = true
    }
}
