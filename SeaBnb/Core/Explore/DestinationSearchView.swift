//
//  DestinationSearchView.swift
//  SeaBnb
//
//  Created by Gianluigi Trontini on 29/07/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
    @State private var startDate: Date = Date()
    @State private var endDate: Date =  Date()
    
    @State private var guests = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                Button("Clear") {
                    startDate = Date()
                    endDate = Date()
                    guests = 1
                    destination = ""
                }
                .foregroundStyle(.black)
            }
            .padding()
            
            // Where To
            VStack(alignment: .leading) {
                if (selectedOption == .location) {
                    Text("Dove vuoi andare?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Cerca destinazioni", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Dove", description: "Aggiungi destinazione")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
        
            // When (collapsed)
            VStack(alignment: .leading) {
                if (selectedOption == .dates) {
                    Text("Quando viaggerai?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("Dal", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("Al", selection: $endDate, displayedComponents: .date)
                    }
                } else {
                    CollapsedPickerView(title: "Quando", description: "Aggiungi date")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
           
            
            // Who (collapsed)
            VStack(alignment: .leading) {
                if (selectedOption == .guests) {
                    Text("Chi ci sarà?")
                        .font(.title2)
                        .fontWeight(.semibold)
               
                        Stepper(value: $guests, in: 1...10) {
                            Text("\(guests) \(guests == 1 ? "ospite" : "ospiti")")
                        }
                    
                } else {
                    CollapsedPickerView(title: "Chi sarete", description: "Aggiungi ospiti")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
        
    }
}

struct CollapsedPickerView: View {
    let title: String;
    let description: String;
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
