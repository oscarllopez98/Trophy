//
//  ActionBarView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct ActionBarView: View {
    
    let addSymbol: Image = Image(systemName: "plus.square")
    let addSymbolForegroundStyleColor: Color = .green

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button(action:  {
                    
                }) {
                    addSymbol
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(addSymbolForegroundStyleColor)
                }
                .foregroundStyle(addSymbolForegroundStyleColor)
                .frame(width: geometry.size.height, height: geometry.size.height)
                .padding()
            }
            .frame(width: geometry.size.width, 
                   height: geometry.size.height,
                   alignment: .center)
            .border(Color.black)
        }
        .border(Color.blue)
    }

}

#Preview {
    ActionBarView()
}
