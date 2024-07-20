//
//  VoiceToTextView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import SwiftUI

struct VoiceToTextView: View {
    @StateObject private var viewModel = VoiceToTextViewModel()
    @State private var showTextBox = false
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: viewModel.isListening ? "mic.circle.fill" : "mic.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        withAnimation {
                            showTextBox.toggle()
                            if showTextBox {
                                viewModel.toggleListening()
                            }
                        }
                    }
                
                if showTextBox {
                    VoiceToTextBoxView(viewModel: viewModel)
                        .transition(.move(edge: .bottom))
                }
            }
            
            if showTextBox {
                // Overlay to detect taps outside the VoiceToTextBoxView
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            showTextBox = false
                            if viewModel.isListening {
                                viewModel.toggleListening()
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    VoiceToTextView()
}
