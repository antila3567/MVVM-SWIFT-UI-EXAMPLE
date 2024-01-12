//
//  KeyConstant.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

enum KeyConstant {
    static func loadAPIKeys() async throws {
        let request = NSBundleResourceRequest(tags: ["ENV"])
        try await request.beginAccessingResources()
        
        if let url = Bundle.main.url(forResource: "env", withExtension: "json") {
            let data = try Data(contentsOf: url)
            
            APIKeys.storage = try JSONDecoder().decode([String: String].self, from: data)
        } else {
            print("file env.json was not found.")
        }

        
        request.endAccessingResources()
    }
    
    enum APIKeys {
        static fileprivate(set) var storage = [String: String]()
        
        static var myAPIKEy: String {storage["API_KEY"] ?? ""}
    }
}
