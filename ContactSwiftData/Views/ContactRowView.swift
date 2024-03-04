//
//  ContactRowView.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI

struct ContactRowView: View {
    @Bindable var contact: Contact
    
    var body: some View {
        HStack() {
            Text(contact.initials)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(Color(.systemGray4))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 6) {
                Text(contact.fullName)
                
                Text(contact.phoneNumber)
                    .font(.footnote)
            }
        }
    }
}
