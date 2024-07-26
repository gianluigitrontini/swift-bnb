//
//  SearchAndFilterBar.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 26/07/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack (alignment: .leading, spacing: 2) {
                Text("Where To?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Anywhere - Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(.white).mask(Capsule())
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.3), radius: 3)
                
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
}
