//
//  ListingDetailView.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 26/07/24.
//

import SwiftUI

struct ListingDetailView: View {
    var body: some View {
        ScrollView {
            ListingImageCarouselView(shapeRadius: 0)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Villa sul mare")
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    ListingDetailView()
}
