//
//  VoiceToTextBoxView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import SwiftUI

struct VoiceToTextBoxView: View {
    @ObservedObject var viewModel: VoiceToTextViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.transcribedText)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    VoiceToTextBoxView(viewModel: VoiceToTextViewModel())
}
