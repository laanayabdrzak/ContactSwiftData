//
//  ContentView.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var searchTxt = ""
    @State private var showCreateContactView: Bool = false
    @Query private var contacts: [Contact]
    @Environment (\.modelContext) private var modelContext
    
    var filteredContacts: [Contact] {
        if searchTxt.isEmpty {
            return contacts
        } else {
            return contacts.filter { contact in
                return contact.fullName.lowercased().contains(searchTxt.lowercased())
            }
        }
    }
    
    var groupedContacts: [String: [Contact]] {
        Dictionary(grouping: filteredContacts) { contact in
            String(contact.fullName.prefix(1)).uppercased()
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(searchTxt: $searchTxt)
                
                List {
                    ForEach(groupedContacts.keys.sorted(), id: \.self) { key in
                        Section(header: Text(key)) {
                            ForEach(groupedContacts[key]!) { contact in
                                NavigationLink(value: contact) {
                                    ContactRowView(contact: contact)
                                }
                                .swipeActions {
                                    Button {
                                        withAnimation {
                                            modelContext.delete(contact)
                                        }
                                    } label: {
                                        Image(systemName: "trash.fill")
                                    }
                                    .tint(.red)
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Contact.self, destination: { person in
                EditContactView(contact: person)
            })
            .sheet(isPresented: $showCreateContactView, content: {
                CreateContactView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showCreateContactView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationTitle("Contacts")
        }
    }
}

#Preview {
    ContentView()
}
