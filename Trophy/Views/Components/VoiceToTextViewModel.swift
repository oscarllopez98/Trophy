//
//  VoiceToTextViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import Foundation
import SwiftUI
import AVFoundation
import Speech

class VoiceToTextViewModel: ObservableObject {
    @Published var isListening: Bool = false
    @Published var transcribedText: String = ""

    private var audioEngine = AVAudioEngine()
    private var inputNode: AVAudioInputNode!
    private var request = SFSpeechAudioBufferRecognitionRequest()
    private var speechRecognizer = SFSpeechRecognizer()

    func toggleListening() {
//        if isListening {
//            stopListening()
//        } else {
//            startListening()
//        }
    }
    
    private func startListening() {
        guard let recognizer = speechRecognizer, recognizer.isAvailable else {
            print("Speech recognizer is not available.")
            return
        }

        request = SFSpeechAudioBufferRecognitionRequest()
        inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine couldn't start because of an error: \(error.localizedDescription)")
            return
        }

        recognizer.recognitionTask(with: request) { result, error in
            if let result = result {
                self.transcribedText = result.bestTranscription.formattedString
            } else if let error = error {
                print("There was an error during speech recognition: \(error.localizedDescription)")
            }
        }
        
        isListening = true
        print("Started listening...")
    }
    
    private func stopListening() {
        audioEngine.stop()
        inputNode.removeTap(onBus: 0)
        request.endAudio()
        
        isListening = false
        print("Stopped listening.")
    }
}
