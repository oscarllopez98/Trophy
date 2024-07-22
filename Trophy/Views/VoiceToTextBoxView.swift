//
//  VoiceToTextBoxView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import SwiftUI

struct VoiceToTextBoxView: View {
    @Binding var transcribedText: String
    @Binding var isTextBoxVisible: Bool

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        Text("Type or use voice input for your exercise description.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Spacer()
                        
                        Button(action: {
                            isTextBoxVisible = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.red)
                        }
                    }
                    .padding([.horizontal])
                    
                    TextEditor(text: $transcribedText)
                        .padding()
                        .background(Color.primary.opacity(0.1))
                        .foregroundColor(Color.primary)
                        .cornerRadius(10)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        print("Submit Clicked!")
                    }) {
                        Text("Submit")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 20)
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    VoiceToTextBoxView(transcribedText: .constant("Example: I ran a marathon today in 3 hours, 48 minutes, and 20 seconds"), isTextBoxVisible: .constant(true))
}
