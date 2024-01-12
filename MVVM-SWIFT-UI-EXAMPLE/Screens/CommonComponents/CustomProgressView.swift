//
//  CustomProgressView.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color.purple))
            .scaleEffect(2.5, anchor: .center)
    }
}

#Preview {
    CustomProgressView()
}
