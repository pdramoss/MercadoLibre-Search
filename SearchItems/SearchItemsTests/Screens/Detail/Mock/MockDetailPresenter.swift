//
//  MockDetailPresenter.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 21/11/21.
//

import XCTest
@testable import SearchItems

class MockDetailPresenter: DetailPresenterProtocol {
    var detailViewController: DetailViewProtocol?
    var presentItemDetailCalled: Bool = false
    var presentErrorCalled: Bool = false
    
    func presentItemDetail(_ itemQuery: ItemQuery) {
        presentItemDetailCalled = true
    }
    
    func presentError(_ error: Error) {
        presentErrorCalled = true
    }
}
