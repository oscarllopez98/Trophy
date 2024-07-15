//
//  TextFieldStyles.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/15/24.
//

import SwiftUI

struct UnderlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
                .padding(.vertical, 10)
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.blue)
        }
    }
}

struct TextFieldWithImage: View {
    @Binding var text: String
    let placeholder: String
    let systemImageName: String

    var body: some View {
        HStack(spacing: 0) {
            TextField(placeholder, text: $text)
                .font(.title2)
                .fontWeight(.light)
                .padding(.trailing, 0)
            Image(systemName: systemImageName)
                .padding(.leading, 0)
        }
    }
}
