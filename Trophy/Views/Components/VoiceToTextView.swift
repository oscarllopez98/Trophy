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

    // Background Sizing
    let backgroundSize: CGFloat = 50.0
    
    // Foreground Sizing
    let voiceToTextSystemName: String = "mic"
    let voiceToTextImageSize: CGFloat = 20.0

    var body: some View {
        ZStack {
            Circle()
                .fill(Color("PrimaryVTTVBackgroundColor"))
                .frame(width: backgroundSize)
            Image(systemName: voiceToTextSystemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: voiceToTextImageSize, height: voiceToTextImageSize)
                .onTapGesture {
                    isTextBoxVisible.toggle()
                }
                .foregroundStyle(Color("PrimaryVTTVForegroundColor"))
        }
    }
}

#Preview {
    VoiceToTextView(isTextBoxVisible: .constant(false))
}
