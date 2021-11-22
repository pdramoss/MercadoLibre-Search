//
//  HomeWorker.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

protocol HomeWorkerProtocol: AnyObject {
    func fetchSearchQuery(_ query: String, completion: @escaping(Result<SearchQuery, Error>) -> Void)
}

class HomeWorker: HomeWorkerProtocol {
    
    private var networking: NetworkingSearchAdapterProtocol?
    
    init(_ networking: NetworkingSearchAdapterProtocol = NetworkingSearchAdapter()) {
        self.networking = networking
    }
    
    func fetchSearchQuery(_ query: String, completion: @escaping (Result<SearchQuery, Error>) -> Void) {
        networking?.search(query, completion: { response in
            switch response {
            case let .success(result):
                completion(.success(result))
            case let .failure(error):
                completion(.failure(error))
            }
        })
    }
}
