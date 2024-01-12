//
//  NavigationStack.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case person
    case paperplane
    case gearshape
}

struct CustomTabs: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .person:
            return .purple
        case .paperplane:
            return .green
        case .gearshape:
            return .blue
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    let isActive: Bool = selectedTab == tab
                    
                    Spacer()
                    Image(systemName: isActive ? fillImage : tab.rawValue)
                        .scaleEffect(isActive ? 1.25 : 1.0)
                        .foregroundColor(isActive ? tabColor : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(Color.primary.opacity(0.95))
            .cornerRadius(40)
            .padding()
        }
    }
}

struct MainNavigation: View {
    @State private var selectedTab: Tab = .person
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            if tab == .person {
                                UsersView()
                            }
                            if tab == .paperplane {
                                PostsView()
                            }
                            if tab == .gearshape {
                                SettingsView()
                            }
                        }
                        .tag(tab)
                    }
                }
            }
            
            VStack {
                Spacer()
                CustomTabs(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MainNavigation()
}
