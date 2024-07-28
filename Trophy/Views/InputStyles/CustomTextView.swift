//
//  CustomTextView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/27/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .padding(.bottom, 10)
                .background(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.gray),
                    alignment: .bottom
                )
        }
    }
}

#Preview {
    CustomTextField()
}
