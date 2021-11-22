//
//  DetailRouter.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import Foundation

protocol DetailRouterProtocol: AnyObject {
    var viewController: DetailViewController? { get set }
}

class DetailRouter: DetailRouterProtocol {
    weak var viewController: DetailViewController?
}
