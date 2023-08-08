//
//  ContentView.swift
//  Learn By Doing
//
//  Created by Matteo Buompastore on 08/08/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    @State private var showSplashScreen = true
    
    //MARK: - BODY
    var body: some View {
        VStack {
            if !showSplashScreen {
                    CarouselCardView()
            } else {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.5)) {
                                showSplashScreen = false
                            }
                        }
                    }
            }
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
