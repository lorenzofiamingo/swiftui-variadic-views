import SwiftUI

/// A multi container view that allows for dynamic insertion of content multiple child views.
///
/// The `MultiVariadicView` is a generic view structure that can hold any type of child content
/// conforming to the `View` protocol. It utilizes a variadic view builder to dynamically
/// construct its layout body from multiple child views.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct MultiVariadicView<Content: View, Body: View>: View {
    
    /// Represents the collection of views of the `VariadicView` content.
    public typealias Children = VariadicViewChildren
    
    private let _tree: _VariadicView.Tree<ViewRoot, Content>
    
    /// Creates an instance of `MultiVariadicView`.
    ///
    /// - Parameters:
    ///   - content: The view content from which child views are inserted.
    ///   - body: A closure that takes the view content `Children` and returns the composite view `Body`.
    public init(
        _ content: Content,
        @ViewBuilder body: @escaping (Children) -> Body
    ) {
        _tree = _VariadicView.Tree(ViewRoot(makeBody: body)) { content }
    }
    
    public var body: some View {
        _tree
    }
    
    private struct ViewRoot: _VariadicView.MultiViewRoot {
        
        let makeBody: (Children) -> Body
        
        func body(children: _VariadicView.Children) -> some View {
            makeBody(Children(children))
        }
    }
}
