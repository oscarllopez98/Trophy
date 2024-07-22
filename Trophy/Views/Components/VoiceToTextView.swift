//
//  VoiceToTextView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import SwiftUI

struct VoiceToTextView: View {
    @StateObject private var viewModel = VoiceToTextViewModel()
    @Binding var isTextBoxVisible: Bool

    let voiceToTextSystemName: String = "mic.circle"
    let voiceToTextImageSize: CGFloat = 40.0

    var body: some View {
        VStack {
            Image(systemName: voiceToTextSystemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: voiceToTextImageSize, height: voiceToTextImageSize)
                .onTapGesture {
                    isTextBoxVisible.toggle()
                }
        }
    }
}

#Preview {
    VoiceToTextView(isTextBoxVisible: .constant(false))
}
