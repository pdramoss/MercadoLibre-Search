//
//  DetailViewModel.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation
import UIKit

struct DetailViewModel {
    var id: String
    var title: String
    var price: Int
    var imageURL: String
    var currency: String
    var availableQuantity: Int
    var soldQuantity: Int
    var address: Address
    var acceptsMercadopago: Bool
    var attributes: [Attributes]
    
    struct Address {
        var stateName: String
        var cityName: String
    }
    
    struct Attributes {
        var id: String
        var valueName: String
        var name: String
    }
}

extension DetailViewModel {
    var priceCurrencyText: String {
        let doubleValue = Double(price)
        let formatter = NumberFormatter()
        formatter.currencyCode = currency
        formatter.currencySymbol = "$ "
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currencyAccounting
        let text = formatter.string(from: NSNumber(value: doubleValue)) ?? "$\(doubleValue)"
        return text.replacingOccurrences(of: ",", with: ".") + " " + self.currency
    }
    
    var numberOfSections: Int {
        return 2
    }
    
    var numberOfRowsInSection: Int {
        return 1
    }
    
    func getTableViewCell(_ indexPath: IndexPath,_ tableView: UITableView) -> UITableViewCell? {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderDetailTableViewCell.identifier,
                                                           for: indexPath) as? HeaderDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(self)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddressDetailTableViewCell.identifier,
                                                           for: indexPath) as? AddressDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(self)
            return cell
        default:
            return nil
        }
    }
}
