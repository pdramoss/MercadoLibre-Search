//
//  ItemDetail.swift
//  SearchItems
//
//  Created by Pedro Ramos on 21/11/21.
//

import Foundation

// MARK: - ItemDetailWelcome
struct ItemDetail: Codable {
    var id: String
    var siteID: String
    var title: String
    var sellerID: Int?
    var categoryID: String?
    var price: Int
    var basePrice: Int?
    var currencyID: String
    var initialQuantity: Int
    var availableQuantity: Int
    var soldQuantity: Int
    var saleTerms: [ItemDetailAttribute]?
    var buyingMode: String?
    var listingTypeID: String?
    var startTime: String?
    var stopTime: String?
    var condition: String?
    var permalink: String?
    var thumbnailID: String?
    var thumbnail: String
    var secureThumbnail: String?
    var pictures: [ItemDetailPicture]
    var descriptions: [ItemDetailDescription]?
    var acceptsMercadopago: Bool
    var shipping: ItemDetailShipping?
    var internationalDeliveryMode: String?
    var sellerAddress: ItemDetailSellerAddress
    var attributes: [ItemDetailAttribute]
    var listingSource: String?
    var status: String?
    var tags: [String]?
    var warranty: String?
    var domainID: String?
    var automaticRelist: Bool?
    var dateCreated: String?
    var lastUpdated: String?
    var health: Int?
    var catalogListing: Bool?
    var channels: [String]?
}

// MARK: - ItemDetailAttribute
struct ItemDetailAttribute: Codable {
    var id: String
    var name: String
    var valueID: String?
    var valueName: String
    var valueStruct: ItemDetailStruct?
    var values: [ItemDetailValue]?
    var attributeGroupID: String?
    var attributeGroupName: String?
}

// MARK: - ItemDetailStruct
struct ItemDetailStruct: Codable {
    var number: Int?
    var unit: String?
}

// MARK: - ItemDetailValue
struct ItemDetailValue: Codable {
    var id: String?
    var name: String?
    var valueStruct: ItemDetailStruct?
}

// MARK: - ItemDetailDescription
struct ItemDetailDescription: Codable {
    var id: String?
}

// MARK: - ItemDetailPicture
struct ItemDetailPicture: Codable {
    var id: String
    var url: String
    var secureURL: String
    var size: String?
    var maxSize: String?
    var quality: String?
}

// MARK: - ItemDetailSellerAddress
struct ItemDetailSellerAddress: Codable {
    var city: ItemDetailCity
    var state: ItemDetailCity
    var country: ItemDetailCity?
    var searchLocation: ItemDetailSearchLocation?
    var id: Int?
}

// MARK: - ItemDetailCity
struct ItemDetailCity: Codable {
    var id: String?
    var name: String
}

// MARK: - ItemDetailSearchLocation
struct ItemDetailSearchLocation: Codable {
    var city: ItemDetailCity?
    var state: ItemDetailCity?
}

// MARK: - ItemDetailShipping
struct ItemDetailShipping: Codable {
    var mode: String?
    var freeMethods: [ItemDetailFreeMethod]?
    var tags: [String]?
    var localPickUp: Bool?
    var freeShipping: Bool?
    var logisticType: String?
    var storePickUp: Bool?
}

// MARK: - ItemDetailFreeMethod
struct ItemDetailFreeMethod: Codable {
    var id: Int?
    var rule: ItemDetailRule?
}

// MARK: - ItemDetailRule
struct ItemDetailRule: Codable {
    var ruleDefault: Bool?
    var freeMode: String?
    var freeShippingFlag: Bool?
}
