//
//  ListingDetailView.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 26/07/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(shapeRadius: 0)
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                        .offset(y: 32)
                }
                
                
            }
            
            // Header
            VStack(alignment: .leading, spacing: 8) {
                Text("Titolo 1")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("4.86")
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("San Benedetto del Tronto, Italy")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
           
            Divider()
            
            // Host Info
            HStack {
                VStack(alignment: .leading) {
                    Text("Tutta la casa affittata da")
                        .font(.headline)
                    
                    Text("John Doe")
                        .font(.headline)

                    
                    HStack(spacing: 2) {
                        Text("4 ospiti -")
                        Text("4 camere da letto -")
                        Text("4 letti -")
                        Text("3 bagni")
                    }
                    .font(.caption)
                }
                
                Spacer()
                
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .foregroundStyle(.gray)
                    .opacity(0.25)
            }
            .padding()
            
            Divider()
            
            // Features
            VStack(alignment: .leading, spacing: 16) {
                ForEach (0 ..< 2) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("i Superhosts sono degli host con ottime valutazioni ed esperienza che sanno garantire un soggiorno top ai loro ospiti.")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding()
            
            Divider()
            
            // Bedrooms
            VStack(alignment: .leading) {
                Text("Dove dormirai")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach (1 ..< 5) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                
                                Text("Stanza \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            // Offerte
            VStack(alignment: .leading, spacing: 16) {
                Text("Cosa offriamo")
                    .font(.headline)
                
                ForEach (0 ..< 5) { feature in
                    HStack {
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                            .font(.footnote)
                        
                        Spacer()
                        
                    }
                }
            }
            .padding()
            
            Divider()
            
            // Offerte
            VStack(alignment: .leading, spacing: 16) {
                Text("Dove sarai")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea()
        .padding(.bottom, 72)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("490 euro")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Totale senza tasse")
                            .font(.footnote)
                        
                        Text("Ott 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Prenota")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal)
            }
            .background(.white)
        }
       
    }
}

#Preview {
    ListingDetailView()
}
