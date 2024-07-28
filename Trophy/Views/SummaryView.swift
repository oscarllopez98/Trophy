//
//  SummaryView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/15/24.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var viewModel: SummaryViewModel
    @Binding var activePage: NavigationBar.Page?
    @State private var isLoading: Bool = false // State to track loading

    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
            Text("\(viewModel.exerciseName)")
                .font(.headline)
            List(viewModel.summaryItems, id: \.self) { item in
                Text(item)
            }
            if isLoading {
                ProgressView() // Display loading spinner
            } else {
                Button("Confirm") {
                    Task {
                        isLoading = true // Start loading
                        await confirm()
                        isLoading = false // Stop loading
                        activePage = .home
                    }
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    activePage = .addEntry
                }) {
                    Text("Back")
                }
            }
        }
    }

    private func confirm() async {
        if let exercise = viewModel.exercise {
            await viewModel.confirm(exercise: exercise)
        }
    }
}

#Preview {
    SummaryView(viewModel: SummaryViewModel(userId: "sampleId"), activePage: .constant(.summary))
}
