//
//  ExploreView.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 26/07/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack {
            
            if (showDestinationSearchView) {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                ScrollView {
                    LazyVStack(spacing: 32, pinnedViews: [.sectionHeaders]) {
                        Section(
                            header: SearchAndFilterBar().onTapGesture {
                                withAnimation(.snappy) {
                                    showDestinationSearchView.toggle()  
                                }
                            }) {
                                ForEach(0 ... 10, id: \.self) { listing in
                                    NavigationLink(value: listing) {
                                        ListingItemView()
                                    }
                                }
                            }
                        
                    }
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
