//
//  VoiceToTextView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import SwiftUI

struct VoiceToTextView: View {
    
    let voiceToTextSystemName: String = "mic.circle"
    let voiceToTextImageSize: CGFloat = 40.0
    let voiceToTextViewModel: VoiceToTextViewModel
    
    init() {
        self.voiceToTextViewModel = VoiceToTextViewModel()
    }
    
    var body: some View {
        Image(systemName: voiceToTextSystemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: voiceToTextImageSize, height: voiceToTextImageSize)
            .onTapGesture {
                voiceToTextViewModel.click()
            }
    }
}

#Preview {
    VoiceToTextView()
}
