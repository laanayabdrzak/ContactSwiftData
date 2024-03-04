//
//  EditContactView.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI

struct EditContactView: View {
    @Bindable var contact: Contact
    @Environment (\.dismiss) private var dismiss
    @State private var randomColor = Color.randomColor
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .fill(randomColor)
                    .frame(width: 160, height: 160)
                
                Text(contact.initials)
                    .foregroundStyle(.white)
                    .font(.title)
                
            }
            .padding(.top, 20)
           
            Button(action: {
                // import photo from library
            }, label: {
                HStack(alignment: .center) {
                    Image(systemName: "camera.on.rectangle.fill")
                        .imageScale(.small)
                }
                .frame(width: 100, height: 28)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(20)
            })
           
            
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First name", text: $contact.firstName)
                    TextField("Last name", text: $contact.lastName)
                    TextField("Phone number", text: $contact.phoneNumber)
                }
                
                Section {
                    TextField("Email", text: $contact.email)
                }
                
                Section(header: Text("Professional Information")) {
                    TextField("Company", text: $contact.company)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    dismiss()
                }
                .bold()
            }
        }
        .navigationTitle("Edit Contact")
        .toolbarTitleDisplayMode(.inline)
    }
}
