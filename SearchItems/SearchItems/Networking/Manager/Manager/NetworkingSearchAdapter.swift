//
//  NetworkingSearchAdapter.swift
//  SearchItems
//
//  Created by Pedro Ramos on 16/11/21.
//

import Foundation

class NetworkingSearchAdapter: DefaultNetworkManager, NetworkingSearchAdapterProtocol {
    var service: NetworkingSearchServiceProtocol
    
    init(_ service: NetworkingSearchServiceProtocol = NetworkingSearchService(NetworkingRouter<NetworkingSearchAPI>())) {
        self.service = service
    }
    
    func search(_ query: String, completion: @escaping (Result<SearchQuery, Error>) -> Void) {
        service.search(query) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response else {
                completion(.failure(ErrorNetworking.failed))
                return
            }
            switch self.handleNetwork(response) {
            case .success:
                do {
                    let content: SearchQuery = try self.load(data: data)
                    completion(.success(content))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func detail(_ id: String, completion: @escaping (Result<ItemDetail, Error>) -> Void) {
        service.detail(id) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response else {
                completion(.failure(ErrorNetworking.failed))
                return
            }
            switch self.handleNetwork(response) {
            case .success:
                do {
                    let content: ItemDetail = try self.load(data: data)
                    completion(.success(content))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
