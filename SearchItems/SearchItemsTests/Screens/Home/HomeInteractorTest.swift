//
//  HomeInteractorTest.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 20/11/21.
//

import XCTest
@testable import SearchItems

class HomeInteractorTest: XCTestCase {
    
    private var sut: HomeInteractor!
    private var mockPresenter: MockHomePresenter!

    override func setUp() {
        super.setUp()
        sut = HomeInteractor()
        mockPresenter = MockHomePresenter()
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockPresenter = nil
    }

    func test_doLoadData_success() {
        // Given
        let worker = HomeWorker(MockNetworkingSearch.shared.getSuccessCall())
        sut.worker = worker
        
        // When
        sut.doLoadData("Quino")
        
        // Then
        XCTAssertTrue(mockPresenter.presentAllItemsCalled)
    }
    
    func test_doLoadData_failed() {
        // Given
        let worker = HomeWorker(MockNetworkingSearch.shared.getFailedCall())
        sut.worker = worker
        
        // When
        sut.doLoadData("Quino")
        
        // Then
        XCTAssertTrue(mockPresenter.presentErrorCalled)
    }
}
