//
//  VoiceToTextView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import SwiftUI

struct VoiceToTextView: View {
    @Binding var isTextBoxVisible: Bool

    var body: some View {
        Button(action: {
            isTextBoxVisible = true
        }) {
            Image(systemName: "mic.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 10)
        }
    }
}


#Preview {
    VoiceToTextView(isTextBoxVisible: .constant(false))
}
