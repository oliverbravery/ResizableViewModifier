//
//  ContentView.swift
//  ResizableViews
//
//  Created by Oliver Bravery on 15/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var width = 200.0
    @State private var height = 200.0
    
    var body: some View {
        Text("Hello, world!")
            .frame(width: width, height: height)
            .modifier(DraggableModifier(width: $width, height: $height, hasBorder: true))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
