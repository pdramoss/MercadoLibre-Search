//
//  MockNetworkingSearch.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 16/11/21.
//

import XCTest
@testable import SearchItems

class MockNetworkingSearch {

    static var shared: MockNetworkingSearch {
        return MockNetworkingSearch()
    }

    func getSuccessCall() -> NetworkingSearchAdapterProtocol {
        return setupNetworking(file: "SearchQuery", code: 200)
    }
    
    func getFailedCall() -> NetworkingSearchAdapterProtocol {
        return setupNetworking(code: 500)
    }
    
    private func setupNetworking(file: String = String(), code: Int) -> NetworkingSearchAdapterProtocol {
        let router = MockRouter.shared.createMockSession(fromJsonFile: file, andStatusCode: code, as: NetworkingSearchAPI.self)
        let service = NetworkingSearchService(router)
        return NetworkingSearchAdapter(service)
    }
}
