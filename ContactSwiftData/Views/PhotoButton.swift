//
//  PhotoButton.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI

struct PhotoButton: View {
    @Binding var selectedImage: UIImage?

    var body: some View {
        Button(action: {
            ImagePicker.shared.showImagePicker { image in
                self.selectedImage = image
            }
        }) {
            Image(systemName: "camera.fill")
                .foregroundColor(.white)
                .font(.subheadline)
                .frame(width: 50, height: 50)
                .padding(.horizontal, 10)
                .background(.gray.opacity(0.24))
                .clipShape(Circle())
        }
    }
}
