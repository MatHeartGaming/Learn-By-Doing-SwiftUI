//
//  SplashScreenView.swift
//  Learn By Doing
//
//  Created by Matteo Buompastore on 08/08/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    //MARK: - PROPERTIES
    
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image("LaunchScreen")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Image("logo-swift-outlined")
                
                Text("Learn by Doing")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 28, weight: .light, design: .rounded))
            } //: VSTACK
        } //: ZSTACK
    }
}


//MARK: - PREVIEW
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
