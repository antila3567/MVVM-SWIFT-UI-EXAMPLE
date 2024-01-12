//
//  MVVM_SWIFT_UI_EXAMPLEApp.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI

@main
struct MVVM_SWIFT_UI_EXAMPLEApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        do {
                            try await KeyConstant.loadAPIKeys()
                            } catch {
                            print(error.localizedDescription)
                            }
                    }
            }
        }
    }
}
