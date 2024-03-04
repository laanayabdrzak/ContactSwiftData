//
//  SelectedImageView.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI

struct SelectedImageView: View {
    var image: UIImage

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 160)
            .clipShape(Circle())
    }
}
