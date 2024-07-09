//
//  NewMatchItemView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import SwiftUI

struct NewMatchItemView: View {
    let match: Match
    var body: some View {
        VStack{
            if let user = match.user {
                Image(user.profileImageURLs[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 96, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(user.firstName)
                    .foregroundStyle(.primary)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
        }
    }
}

#Preview {
    NewMatchItemView(match: MockData.matches[0])
}
