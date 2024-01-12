//
//  LanguagePopup.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI


struct GlobalErrorView: View {
    let errorMSG: String
    let refetch: () -> ()
    let close: () -> ()
    
    @State private var isExpanded = false

    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Image("error_icon")
                    .resizable()
                    .frame(width: 150, height: 110)

                Text("Error")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.vertical, 10)

                Text("The reason of an error is - \(errorMSG)")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)

                Button {
                  refetch()
                } label: {
                    Text("Try again")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                }
                .background(Color.primary)
                .cornerRadius(8)
                .padding(.top, 20)
                
                Button {
                    withAnimation {
                        close()
                    }
                } label: {
                    Text("Close")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                }
                .background(Color.secondary)
                .cornerRadius(8)


            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(15)
            .opacity(isExpanded ? 1 : 0)
            .animation(.easeInOut(duration: 0.5))
            .scaleEffect(isExpanded ? 1 : 0)
            
            Spacer()
        }
        .background(Color.primary.opacity(0.9))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation {
                isExpanded = true
            }
        }
        .onDisappear {
            withAnimation {
                isExpanded = false
            }
        }
    }
}

#Preview {
    GlobalErrorView(errorMSG: "Hello", refetch: { }, close: {})
}
