//
//  DetailPresenterTest.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 21/11/21.
//

import XCTest
@testable import SearchItems

class DetailPresenterTest: XCTestCase {
    
    private var sut: DetailPresenter!
    private var mockView: MockDetailView!
    
    override func setUp() {
        super.setUp()
        sut = DetailPresenter()
        mockView = MockDetailView()
        sut.detailViewController = mockView
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockView = nil
    }
    
    func test_present() {
        // When
        sut.presentItemDetail(getItemQuery())
        
        // Then
        XCTAssertTrue(mockView.displayViewModelCalled)
    }
    
    private func getItemQuery() -> ItemQuery {
        return ItemQuery(id: "123456",
                         title: "Title",
                         price: 23500,
                         currencyId: "COP",
                         availableQuantity: 1,
                         soldQuantity: 1,
                         thumbnail: "url",
                         acceptsMercadopago: true,
                         address: ItemQueryAddress(stateId: "stateId",
                                                   stateName: "state",
                                                   cityId: "cityId",
                                                   cityName: "city"),
                         attributes: [])
    }
}
