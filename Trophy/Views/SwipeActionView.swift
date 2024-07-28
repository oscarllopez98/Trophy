//
//  SwipeActionView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/26/24.
//

import SwiftUI

struct SwipeActionView: View {
    var body: some View {
        List {
            Text("Swipe me!")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(action: {
                        print("Swipe action triggered")
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
        }
    }
}

struct SwipeActionView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionView()
    }
}
