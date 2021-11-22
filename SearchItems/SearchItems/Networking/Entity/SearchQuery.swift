//
//  SearchQuery.swift
//  SearchItems
//
//  Created by Pedro Ramos on 15/11/21.
//

import Foundation

struct SearchQuery: Codable {
    var siteId: String
    var countryDefaultTimeZone: String
    var query: String
    var results: [ItemQuery]
    var paging: SearchQueryPaging
    var sort: SearchQuerySort
    var availableSorts: [SearchQuerySort]
    var filters: [SearchQueryFilter]
    var availableFilters: [SearchQueryAvailableFilter]
}

struct SearchQueryPaging: Codable {
    var total: Int
    var primaryResults: Int
    var offset: Int
    var limit: Int
}

struct SearchQuerySort: Codable {
    var id: String
    var name: String
}

struct SearchQueryFilter: Codable {
    var id: String
    var name: String
    var type: String
    var values: [SearchQueryFilterValue]
}

struct SearchQueryFilterValue: Codable {
    var id: String
    var name: String
    var pathFromRoot: [SearchQuerySort]?
}

struct SearchQueryAvailableFilter: Codable {
    var id: String
    var name: String
    var type: String
    var values: [SearchQueryAvailableFilterValue]
}

struct SearchQueryAvailableFilterValue: Codable {
    var id: String
    var name: String
    var results: Int
}
