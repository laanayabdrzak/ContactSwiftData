//
//  CreateContactView.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI

struct CreateContactView: View {
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var company = ""
    @State private var isDoneButtonDisabled = true
    @State private var randomColor = Color.randomColor
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Circle()
                        .fill(randomColor)
                        .frame(width: 160, height: 160)
                    
                    PhotoButton(selectedImage: $selectedImage)
                    
                    if let image = selectedImage {
                        SelectedImageView(image: image)
                    }
                }
                .padding(.top, 20)
                
                Form {
                    Section {
                        TextField("First name", text: $firstName)
                            .onChange(of: firstName) { updateDoneButtonState() }
                        
                        TextField("Last name", text: $lastName)
                            .onChange(of: lastName) { updateDoneButtonState() }
                    }
                    
                    Section {
                        TextField("Phone number", text: $phoneNumber)
                            .onChange(of: phoneNumber) { updateDoneButtonState() }
                        
                        TextField("Email", text: $email)
                            .onChange(of: email) { updateDoneButtonState() }
                    }
                    
                    Section {
                        TextField("Company", text: $company)
                            .onChange(of: company) { updateDoneButtonState() }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        withAnimation {
                            let newContact = Contact(firstName: firstName,
                                                     lastName: lastName,
                                                     phoneNumber: phoneNumber,
                                                     email: email,
                                                     company: company,
                                                     lastUpdate: Date())
                            
                            modelContext.insert(newContact)
                            dismiss()
                        }
                    }
                    .bold()
                    .disabled(isDoneButtonDisabled)
                }
            }
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension CreateContactView {
    private func updateDoneButtonState() {
        isDoneButtonDisabled = firstName.isEmpty && lastName.isEmpty && phoneNumber.isEmpty
    }
}

#Preview {
    CreateContactView()
}
