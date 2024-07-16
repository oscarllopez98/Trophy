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

    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
            List(viewModel.summaryItems, id: \.self) { item in
                Text(item)
            }
            Button("Confirm") {
                confirm()
            }
            .buttonStyle(.bordered)
            .padding()
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

    private func confirm() {
        print("Confirmed!")
        activePage = .home
    }
}

#Preview {
    SummaryView(viewModel: SummaryViewModel(userId: "sampleId"), activePage: .constant(.summary))
}
