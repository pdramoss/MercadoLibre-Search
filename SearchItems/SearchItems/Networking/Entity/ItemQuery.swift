//
//  ItemQuery.swift
//  SearchItems
//
//  Created by Pedro Ramos on 16/11/21.
//

import Foundation

struct ItemQuery: Codable {
    var id: String
    var title: String
    var price: Int
    var currencyId: String
    var availableQuantity: Int
    var soldQuantity: Int
    var thumbnail: String
    var acceptsMercadopago: Bool
    var address: ItemQueryAddress
    var attributes: [ItemQueryAttribute]
}

struct ItemQueryAddress: Codable {
    var stateId: String?
    var stateName: String
    var cityId: String?
    var cityName: String
}

struct ItemQueryAttribute: Codable {
    var id: String
    var name: String?
    var valueName: String?
}
