//
//  ResizeModifer.swift
//  ResizableViews
//
//  Created by Oliver Bravery on 15/04/2023.
//

import SwiftUI

enum nodePosition {
    case TopLeft, Top, TopRight,
    CenterLeft, CenterRight,
    BottomLeft,Bottom,BottomRight
}

struct DraggableNode: View {
    @Binding var width: Double
    @Binding var height: Double
    
    let nodeType: nodePosition
    
    let minimumSize: (width: Double, height: Double)
    
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        switch nodeType {
                        case .TopLeft:
                            width = max(minimumSize.width, width - value.translation.width)
                            height = max(minimumSize.height, height - value.translation.height)
                        case .Top:
                            height = max(minimumSize.height, height - value.translation.height)
                        case .TopRight:
                            width = max(minimumSize.width, width + value.translation.width)
                            height = max(minimumSize.height, height - value.translation.height)
                        case .CenterLeft:
                            width = max(minimumSize.width, width - value.translation.width)
                        case .CenterRight:
                            width = max(minimumSize.width, width + value.translation.width)
                        case .BottomLeft:
                            width = max(minimumSize.width, width - value.translation.width)
                            height = max(minimumSize.height, height + value.translation.height)
                        case .Bottom:
                            height = max(minimumSize.height, height + value.translation.height)
                        case .BottomRight:
                            width = max(minimumSize.width, width + value.translation.width)
                            height = max(minimumSize.height, height + value.translation.height)
                        }
                    }
            )
    }
}

struct DraggableModifier: ViewModifier {
    @Binding var width: Double
    @Binding var height: Double
    @State private var phase = 0.0
    
    let hasBorder: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if hasBorder {
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 4, dash: [5], dashPhase: phase))
                         .onAppear {
                             withAnimation(.linear.repeatForever(autoreverses: false)) {
                                 phase -= 10
                             }
                         }
                }
            }
            .overlay {
                DraggableNode(width: $width, height: $height, nodeType: .TopLeft, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: 0, y: 0))
                DraggableNode(width: $width, height: $height, nodeType: .Top, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: width/2, y: 0))
                DraggableNode(width: $width, height: $height, nodeType: .TopRight, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: width, y: 0))
                DraggableNode(width: $width, height: $height, nodeType: .CenterLeft, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: 0, y: height / 2))
                DraggableNode(width: $width, height: $height, nodeType: .CenterRight, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: width, y: height / 2))
                DraggableNode(width: $width, height: $height, nodeType: .BottomLeft, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: 0, y: height))
                DraggableNode(width: $width, height: $height, nodeType: .Bottom, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: width/2, y: height))
                DraggableNode(width: $width, height: $height, nodeType: .BottomRight, minimumSize: (width: 100, height: 100))
                    .position(CGPoint(x: width, y: height))
            }
    }
}
