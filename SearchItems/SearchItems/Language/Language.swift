//
//  Language.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

protocol CustomLocalizable {
    var localizableKey: String { get }
}

enum Language {
    enum HomeScreen: String, CustomLocalizable {
        var localizableKey: String {
            return self.rawValue.getLocalizableFromKey()
        }
        
        case title = "HomeScreenTitle"
        case searchBarText = "SearchBarText"
    }
    
    enum DetailScreen: String, CustomLocalizable {
        var localizableKey: String {
            return self.rawValue.getLocalizableFromKey()
        }
        
        case acceptsMercadopago = "acceptsMercadopago"
        case notAcceptsMercadopago = "notAcceptsMercadopago"
        case availableQuantity = "availableQuantity"
        case soldQuantity = "soldQuantity"
        case stateAddressDetail = "stateAddressDetail"
        case cityAddressDetail = "cityAddressDetail"
    }
    
    enum CommonScreen: String, CustomLocalizable {
        var localizableKey: String {
            return self.rawValue.getLocalizableFromKey()
        }
        
        case error = "Error"
        case cancel = "Cancel"
    }
}

fileprivate extension String {
    func getLocalizableFromKey() -> String {
        NSLocalizedString(self, comment: "")
    }
}
