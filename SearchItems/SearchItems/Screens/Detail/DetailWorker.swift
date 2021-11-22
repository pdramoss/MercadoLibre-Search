//
//  DetailWorker.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

protocol DetailWorkerProtocol: AnyObject {
    func fetchItemDetail(_ id: String, completion: @escaping(Result<ItemDetail, Error>) -> Void)
}

class DetailWorker: DetailWorkerProtocol {
    private var networking: NetworkingSearchAdapterProtocol?
    
    init(_ networking: NetworkingSearchAdapterProtocol = NetworkingSearchAdapter()) {
        self.networking = networking
    }
    
    func fetchItemDetail(_ id: String, completion: @escaping (Result<ItemDetail, Error>) -> Void) {
        networking?.detail(id, completion: { response in
            switch response {
            case let .success(detail):
                completion(.success(detail))
            case let .failure(error):
                completion(.failure(error))
            }
        })
    }
}
