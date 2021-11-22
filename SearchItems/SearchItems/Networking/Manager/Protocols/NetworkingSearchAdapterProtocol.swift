//
//  NetworkingSearchAdapterProtocol.swift
//  SearchItems
//
//  Created by Pedro Ramos on 16/11/21.
//

import Foundation

protocol NetworkingSearchAdapterProtocol {
    var service: NetworkingSearchServiceProtocol { get set }
    
    func search(_ query: String, completion: @escaping (Result<SearchQuery, Error>) -> Void)
    func detail(_ id: String, completion: @escaping (Result<ItemDetail, Error>) -> Void)
}

protocol NetworkingSearchServiceProtocol {
    func search(_ query: String, completion: @escaping NetworkingRouterCompletion)
    func detail(_ id: String, completion: @escaping NetworkingRouterCompletion)
}
