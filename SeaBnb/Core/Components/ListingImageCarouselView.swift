//
//  ListingImageCarouselView.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 26/07/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var height: CGFloat = 320;
    var shapeRadius: CGFloat = 10;
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: height)
        .clipShape(RoundedRectangle(cornerRadius: shapeRadius))
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
