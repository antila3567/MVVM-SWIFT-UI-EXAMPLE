//
//  UIWithNetwork.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI

struct UIWithNetwork<Content: View>: View {
    var error: String
    var isLoading: Bool
    var fetcher: () -> Void
    var errorCleaner: () -> Void
    var Component: () -> Content
    
    var body: some View {
        VStack {
                if isLoading {
                      CustomProgressView()
                } else if !error.isEmpty {
                        GlobalErrorView(
                          errorMSG: error,
                          refetch: fetcher,
                          close: errorCleaner
                        )
                } else {
                    Component()
                }
            }
            .onAppear {
                fetcher()
            }
    }
}
