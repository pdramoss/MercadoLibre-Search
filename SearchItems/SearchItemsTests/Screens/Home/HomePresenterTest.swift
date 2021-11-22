//
//  HomePresenterTest.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 20/11/21.
//

import XCTest
@testable import SearchItems

class HomePresenterTest: XCTestCase {
    private var sut: HomePresenter!
    private var mockView: MockHomeView!

    override func setUp() {
        super.setUp()
        sut = HomePresenter()
        mockView = MockHomeView()
        sut.homeViewController = mockView
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockView = nil
    }
    
    func test_presentAllItems() {
        // When
        sut.presentAllItems(getSearchQuery())
        
        // Then
        XCTAssertTrue(mockView.displayItemsCalled)
    }
    
    func test_presentError() {
        // When
        sut.presentError(error: ErrorNetworking.failed)
        
        // Then
        XCTAssertTrue(mockView.displayErrorCalled)
    }
    
    private func getSearchQuery() -> SearchQuery {
        return SearchQuery(siteId: "123456",
                           countryDefaultTimeZone: "MCO",
                           query: "Query",
                           results: [getItemQuery()],
                           paging: SearchQueryPaging(total: 100,
                                                     primaryResults: 100,
                                                     offset: 100,
                                                     limit: 100),
                           sort: SearchQuerySort(id: "123",
                                                 name: "sort"),
                           availableSorts: [],
                           filters: [],
                           availableFilters: [])
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
