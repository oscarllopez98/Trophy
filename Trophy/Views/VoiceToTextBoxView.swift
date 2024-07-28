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
    @Binding var activePage: NavigationBar.Page?
    @ObservedObject var viewModel: VoiceToTextViewModel
    @ObservedObject var homeViewModel: ExerciseCardListViewModel

    @State private var placeholder: String = "Example: I ran a marathon today in 3 hours, 48 minutes, and 20 seconds"
    @State private var isEditing: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        Text("Type or use voice input")
                            .font(.headline)
                            .foregroundColor(Color.primary)
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
                    
                    ZStack(alignment: .leading) {
                        if transcribedText.isEmpty && !isEditing {
                            Text(placeholder)
                                .foregroundColor(Color.secondary)
                                .padding(.horizontal)
                        }
                        
                        TextEditor(text: $transcribedText)
                            .padding(.horizontal)
                            .foregroundColor(Color.primary)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(10)
                            .onTapGesture {
                                if !isEditing {
                                    isEditing = true
                                    transcribedText = ""
                                }
                            }
                            .onChange(of: transcribedText) { newValue in
                                if transcribedText.count > 250 {
                                    transcribedText = String(transcribedText.prefix(250))
                                }
                            }
                    }
                    .border(Color.secondary.opacity(0.25))
                    
                    Text("\(transcribedText.count)/250 characters")
                        .font(.caption)
                        .foregroundColor(transcribedText.count > 250 ? .red : .gray)
                        .padding(.bottom, 5)

                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.bottom, 20)
                    } else {
                        Button(action: {
                            Task {
                                await submit()
                                isTextBoxVisible.toggle()
                                activePage = .home
                                homeViewModel.fetchExercisesIfNeeded()  // Refresh exercises on the home view
                            }
                        }) {
                            Text("Submit")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.bottom, 20)
                    }
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                .background(Color(UIColor.systemBackground))
                .cornerRadius(15)
                .shadow(radius: 10)
            }
        }
    }
    
    private func submit() async {
        // Verify that text exists
        if !transcribedText.isEmpty {
            await viewModel.submit(inputText: transcribedText)
        }
    }
}

#Preview {
    VoiceToTextBoxView(transcribedText: .constant(""), isTextBoxVisible: .constant(true), activePage: .constant(.home), viewModel: VoiceToTextViewModel(), homeViewModel: ExerciseCardListViewModel(userId: "sampleUserId"))
}
