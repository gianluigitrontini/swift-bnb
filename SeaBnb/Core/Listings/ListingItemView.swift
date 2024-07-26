//
//  ListingView.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 26/07/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("San Benedetto del Tronto, Italy")
                        .fontWeight(.semibold)
                    
                    Text("10km da qui")
                        .foregroundStyle(.gray)
                    
                    Text("Agosto 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 3) {
                        Text("€80")
                            .fontWeight(.semibold)
                        Text("al giorno")
                    }
                    
                }
                Spacer()
                // rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
            }
            .font(.footnote)
        }
        .foregroundStyle(.black)
        .padding()
    }
}

#Preview {
    ListingItemView()
}
