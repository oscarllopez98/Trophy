//
//  CustomPicker.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/27/24.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var selection: Int
    var options: [String]
    var title: String

    var body: some View {
        VStack {
            Picker(title, selection: $selection) {
                ForEach(0..<options.count, id: \.self) {
                    Text(options[$0]).tag($0)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .background(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.gray),
                alignment: .bottom
            )
        }
        .padding(.bottom, 10)
    }
}


#Preview {
    CustomPicker(selection: .constant(1), options: ["Option1","Option2"], title: "DefTitle")
}
