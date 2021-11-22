//
//  NetworkingSearchAPI.swift
//  SearchItems
//
//  Created by Pedro Ramos on 16/11/21.
//

import Foundation

enum NetworkingSearchAPI {
    case searchWithQuery(query: String)
    case itemDetail(id: String)
}

extension NetworkingSearchAPI: EndPointType {
    var path: String {
        switch self {
        case .searchWithQuery:
            return "/search"
        case let .itemDetail(id):
            return "/items/\(id)"
        }
    }
    
    var data: Data? {
        return nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .searchWithQuery(let query):
            return ["q" : query]
        default:
            return nil
        }
    }
}
