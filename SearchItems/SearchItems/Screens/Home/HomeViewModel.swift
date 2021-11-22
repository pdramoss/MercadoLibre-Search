//
//  HomeViewModel.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

struct HomeViewModel {
    struct Item {
        var id: String
        var title: String
        var price: Int
        var imageURL: String
        var currency: String
        var itemQuery: ItemQuery?
    }
    
    var siteId: String
    var list: [Item]
    var query: String
}

extension HomeViewModel.Item {
    var priceCurrencyText: String {
        let doubleValue = Double(price)
        let formatter = NumberFormatter()
        formatter.currencyCode = currency
        formatter.currencySymbol = "$ "
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currencyAccounting
        let text = formatter.string(from: NSNumber(value: doubleValue)) ?? "$\(doubleValue)"
        return text.replacingOccurrences(of: ",", with: ".")
    }
}
