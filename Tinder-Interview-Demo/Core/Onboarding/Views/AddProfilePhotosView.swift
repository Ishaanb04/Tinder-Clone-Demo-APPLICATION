//
//  AddProfilePhotosView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import PhotosUI
import SwiftUI

struct AddProfilePhotosView: View {
    @State private var selectedPhotoItems = [PhotosPickerItem]()
    @State private var profileImages = [Image]()
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Add your recent pics?")
                    .font(.title)
                    .fontWeight(.bold)

                Text("The first item will be your main profile picture")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            PhotosPicker(selection: $selectedPhotoItems, maxSelectionCount: maxSelectionCount) {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(0 ..< maxSelectionCount, id: \.self) { index in
                        ZStack(alignment: .bottomTrailing) {
                            if index < profileImages.count {
                                profileImages[index]
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 110, height: 160)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.secondarySystemBackground))
                                    .frame(width: 110, height: 160)
                                Image(systemName: "plus.circle.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(Color(.primaryText))
                                    .offset(x: 8, y: 4)
                            }
                        }
                    }
                }
            }

            Spacer()
            HStack {
                ZStack {
                    Circle()
                        .stroke(Color(.systemGray3), lineWidth: 2)
                        .frame(width: 48, height: 48)

                    Text("\(profileImages.count) / \(maxSelectionCount)")

                        .fontWeight(.semibold)
                }

                Text("Hey! Let's add 2 to start. We reccomend a face pic.")
            }
            .font(.subheadline)

            NextButton()
        }
        .navigationBarBackButtonHidden()
        .onChange(of: selectedPhotoItems) { _, _ in
            loadProfilePhoto()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
        .padding()
    }
}

private extension AddProfilePhotosView {
    private var columns: [GridItem] {
        return Array(repeating: .init(), count: 3)
    }

    var maxSelectionCount: Int {
        return 6
    }

    func loadProfilePhoto() {
        Task {
            var image = [UIImage]()
            for item in selectedPhotoItems {
                guard let imageData = try? await item.loadTransferable(type: Data.self) else { return }
                guard let uiImage = UIImage(data: imageData) else { return }
                image.append(uiImage)
            }
            self.profileImages = image.map { Image(uiImage: $0) }
        }
    }
}

#Preview {
    AddProfilePhotosView()
}
