//
//  NetworkingSearchService.swift
//  SearchItems
//
//  Created by Pedro Ramos on 16/11/21.
//

import Foundation

class NetworkingSearchService<Router: NetworkingRouterProtocol>: NetworkingBaseRouterProtocol, NetworkingSearchServiceProtocol where Router.EndPoint == NetworkingSearchAPI{
    var router: Router
    
    init(_ router: Router) {
        self.router = router
    }
    
    func search(_ query: String, completion: @escaping NetworkingRouterCompletion) {
        router.request(.searchWithQuery(query: query)) { completion($0, $1, $2) }
    }
    
    func detail(_ id: String, completion: @escaping NetworkingRouterCompletion) {
        router.request(.itemDetail(id: id)) { completion($0, $1, $2) }
    }
}
