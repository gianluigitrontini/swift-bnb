//
//  ExploreView.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 26/07/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32, pinnedViews: [.sectionHeaders]) {
                    Section(header: SearchAndFilterBar()) {
                        ForEach(0 ... 10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                            }
                        }
                    }
                    
                }
            }
            .navigationDestination(for: Int.self) { listing in
                Text("Listing detail view")
            }
        }
    }
}

#Preview {
    ExploreView()
}
