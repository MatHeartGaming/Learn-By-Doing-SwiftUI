//
//  CardView.swift
//  Learn By Doing
//
//  Created by Matteo Buompastore on 08/08/23.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - PROPERTIES
    var card : Card
    @State private var fadeIn : Bool = false
    @State private var moveDownward : Bool = false
    @State private var moveUpward : Bool = false
    @State private var showAlert : Bool = false
    private let gradient : [Color] = [Color("Color01"), Color("Color02")]
    let hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    
    //MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .opacity(fadeIn ? 1 : 0)
            
            VStack {
                Text(card.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
                
                Spacer()
            } //: VSTACK
            .padding(.top, moveDownward ? 24 : 0)
            .opacity(moveDownward ? 1 : 0)
            
            Button {
                print("Button tapped \(card.callToAction)")
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .tint(.accentColor)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.title.weight(.medium))
                        .foregroundColor(.white)
                } //: HSTACK
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom)
                )
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            } //: BUTTON
            .padding(.bottom, moveUpward ? 24 : 0)
            .opacity(moveUpward ? 1 : 0)

            
            
        } //: ZSTACK
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.easeInOut(duration: 0.8)) {
                moveDownward.toggle()
            }
            
            withAnimation(.spring(response: 1)) {
                moveUpward.toggle()
            }
        }
        .alert(card.title, isPresented: $showAlert, actions: {
            Button {
                showAlert = false
            } label: {
                Text("OK")
            }
        }, message: {
            Text(card.message)
        })
    }
}


//MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
