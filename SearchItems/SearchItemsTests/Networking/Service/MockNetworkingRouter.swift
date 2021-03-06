//
//  MockNetworkingRouter.swift
//  SearchItemsTests
//
//  Created by Pedro Ramos on 16/11/21.
//

import XCTest
@testable import SearchItems

class MockNetworkingRouter<EndPoint: EndPointType>: NetworkingRouterProtocol {
    var completionHandler: (Data?, HTTPURLResponse?, Error?)
    
    init(completionHandler: (Data?, HTTPURLResponse?, Error?)) {
        self.completionHandler = completionHandler
    }
    
    func request(_ route: EndPoint, completion: @escaping NetworkingRouterCompletion) {
        printEnpointInformation(route)
        completion(completionHandler.0, completionHandler.1, completionHandler.2)
    }
    
    private func printEnpointInformation(_ route: EndPoint) {
        Logger.info("\n\n\n\tš -START- š" +
                    "\nš -\(String(describing: route.self))- š" +
                    "\nš PATH: \(route.path) š" +
                    self.printData(data: route.data) +
                    "\nš HTTPMethod: \(route.httpMethod) š" +
                    "\nš Parameters: \(String(describing: route.parameters)) š" +
                    "\nš HTTPHeaders: \(String(describing: route.headers)) š" +
                    "\n\tš -END- š\n\n\n")
        
    }
    
    private func printData(data: Data?) -> String {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            return "\nš DATA JSON: \(json) š"
        }
        return String()
    }
    
    func cancel() {}
}

class MockRouter {
    
    static var shared = MockRouter()
    
    private init() {}
    
    private func loadJsonData(file: String) -> Data? {
        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            
            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
    
    func createMockSession<T: EndPointType>(fromJsonFile file: String = String(),
                                            andStatusCode code: Int,
                                            andError error: Error? = nil, as type: T.Type = T.self,
                                            headers: HTTPHeaders? = nil) -> MockNetworkingRouter<T> {
        
        let data = file.isEmpty ? nil : loadJsonData(file: file)
        let response = HTTPURLResponse(
            url: URL(string: "URL")!,
            statusCode: code,
            httpVersion: nil,
            headerFields: headers)
        return MockNetworkingRouter<T>(completionHandler: (data, response, error))
    }
}
