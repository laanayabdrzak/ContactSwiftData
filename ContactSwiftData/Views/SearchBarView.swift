//
//  SearchBarView.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchTxt: String
    
    var body: some View {
        ZStack {	
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.24))
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(.systemGray))
                
                TextField("Search", text: $searchTxt)
                
                Spacer()
                
                Button(action: {
                    searchTxt = ""
                }, label: {
                    Image(systemName: searchTxt.isEmpty ? "mic.fill" : "xmark.circle.fill")
                        .tint(Color(.systemGray))
                })
            }
            .padding(.horizontal)
        }
        .frame(width: 358, height: 36)
    }
}

#Preview {
    SearchBarView(searchTxt: .constant(""))
}
