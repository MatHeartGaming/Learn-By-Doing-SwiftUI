//
//  CarouselCardView.swift
//  Learn By Doing
//
//  Created by Matteo Buompastore on 08/08/23.
//

import SwiftUI

struct CarouselCardView: View {
    
    //MARK: - PROPERTIES
    
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardData) { card in
                    CardView(card: card)
                }
            } //: HSTACK
            .padding()
        } //: SCROLLVIEW
    }
}


//MARK: - PREVIEW
struct CarouselCardView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCardView()
            .previewLayout(.sizeThatFits)
            //.padding()
    }
}
