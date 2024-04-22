# SwiftUI VariadicViews 🥞

`VariadicViews` extends SwiftUI's capabilities by introducing a versatile way to extrapolate child views dynamically from opaque view content.
To know more about please read [this awesome blog post from Moving Parts](https://movingparts.io/variadic-views-in-swiftui).

## Usage

Integrating `VariadicViews` is as simple as integrating standard SwiftUI views.

```swift
import VariadicViews

UnaryVariadicView(content) { views in
    let last = views.last?.id
    
    ForEach(views) { view in
        view
        
        if view.id != last {
            Divider()
        }
    }
}
```

`UnaryVariadicChildren` produces an unary container (like a `VStack`), `MultiVariadicChildren` produces a multi container (like a `TupleView`).
`VariadicViewChildren` is a collection of hashable and identifiable views.

Elements of `VariadicViewChildren` can handle view traits.
View traits work similar to preference values and can be read directly by subscripting `VariadicViewChildren` elements.

```swift
struct MyString: ViewTraitKey {
    static var defaultValue: String? = .none
}

extension View {
    func myString(_ value: String) -> some View {
        trait(key: MyTag.self, value: value)
    }
}

// After using `myString` modifier in some of the views of content

MultiVariadicView(content) { children in
    VStack {
        ForEach(children) { child in
            if let string = child[MyString.self] {
                Text(string)
            }
        }
    }
}
```
        

## Installation

1. Open Xcode, navigate to your project, and select **File** → **Swift Packages** → **Add Package Dependency...**
2. Enter the repository URL: `https://github.com/lorenzofiamingo/swiftui-variadic-views` and proceed by clicking **Next**.
3. Finalize the installation by clicking **Finish**.


## Other Projects

- [SwiftUI CachedAsyncImage 🗃️](https://github.com/lorenzofiamingo/swiftui-cached-async-image)

- [SwiftUI AsyncButton 🖲️](https://github.com/lorenzofiamingo/swiftui-async-button)

- [SwiftUI MapItemPicker 🗺️](https://github.com/lorenzofiamingo/swiftui-map-item-picker)

- [SwiftUI PhotosPicker 🌇](https://github.com/lorenzofiamingo/swiftui-photos-picker)

- [SwiftUI VerticalTabView 🔝](https://github.com/lorenzofiamingo/swiftui-vertical-tab-view)

- [SwiftUI SharedObject 🍱](https://github.com/lorenzofiamingo/swiftui-shared-object)
