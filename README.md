# Draggable View Resize Modifier
This is a SwiftUI project that contains a custom SwiftUI modifier called DraggableModifier. This view adds draggable handles around a views frame, allowing the user to adjust its width and height.

## Getting started
To use `DraggableModifier` in your project, simply copy the `ResizeModifer.swift` file into your project.

## Usage
You can use `DraggableModifier` on any view. It will add draggable handles around the view's frame, allowing the user to adjust its width and height.

```Swift
struct ContentView: View {
    @State private var width = 200.0
    @State private var height = 200.0
    
    var body: some View {
        Text("Hello, world!")
            .frame(width: width, height: height)
            .modifier(DraggableModifier(width: $width, height: $height, hasBorder: true))
    }
}
```

The `hasBorder` parameter is a non-optional boolean. If set to `true`, an animated dotted border will be drawn around the view.

The `width` and `height` parameters represent the view's width and height. These are `Binding<Double>` values, so they can be updated by the modifier. The values should be passed in as `@State` variables. They represent the current width and height of the view.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
