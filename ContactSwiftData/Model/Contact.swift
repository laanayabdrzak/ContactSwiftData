//
//  Contact.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import Foundation
import SwiftData

@Model
class Contact: ObservableObject {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String
    var company: String
    
    var lastUpdate: Date
    
    var initials: String {
        let first = firstName.prefix(1)
        let last = lastName.prefix(1)
        return String(first + last)
    }
    
    var fullName: String { return "\(firstName) \(lastName)" }
    
    init(firstName: String, lastName: String, phoneNumber: String, email: String, company: String, lastUpdate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.company = company
        self.lastUpdate = lastUpdate
    }
}

extension Contact: Identifiable {}

extension Contact: Hashable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.firstName == rhs.firstName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
    }
}
