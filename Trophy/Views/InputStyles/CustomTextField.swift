//
//  CustomTextField.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/27/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .padding(.bottom, 10)
                .background(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.gray),
                    alignment: .bottom
                )
        }
        .padding(.bottom, 10)
    }
}


#Preview {
    CustomTextField(text: .constant("Default"), placeholder: "Placeholder")
}
