//
//  DetailInteractorTest.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 21/11/21.
//

import XCTest
@testable import SearchItems

class DetailInteractorTest: XCTestCase {
    private var sut: DetailInteractor!
    private var mockPresenter: MockDetailPresenter!
    
    override func setUp() {
        super.setUp()
        sut = DetailInteractor()
        mockPresenter = MockDetailPresenter()
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockPresenter = nil
    }
    
    func test_loadData() {
        // When
        sut.doLoadItem(getItemQuery())
        
        // Then
        XCTAssertTrue(mockPresenter.presentItemDetailCalled)
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
