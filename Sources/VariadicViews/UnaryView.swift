import SwiftUI

/// A container view that wraps `Content` in unary view.
///
/// Most views such as `ZStack`, `VStack` and `HStack` are
/// unary views. This means they would produce a single subview
/// if transformed by a ``VariadicView``.  This is contrary to `ForEach`,
/// `TupleView`, `Section` and `Group` which would produce multiple
/// subviews. This different in behaviour can be crucial, as it impacts: layout,
/// how a view is modified by a `ViewModifier`, and performance.
///
/// > Tip: In most cases you shouldn't need to use ``UnaryView``,
/// but it can help fix rare performance problems or layout crashes.
///
/// For example a unary view will result in a single subview when used as
/// the source for a ``VariadicView``. Whereas a `TupleView`
/// would result in N subviews, one for each element in the tuple.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct UnaryView<Content: View>: View {
    
    private var _adaptor: _UnaryViewAdaptor<Content>
    
    public var content: Content {
        _adaptor.content
    }
    
    /// Creates an instance of `UnaryView`.
    ///
    /// - Parameters:
    ///   - content: The view content.
    public init(_ content: Content) {
        self._adaptor = _UnaryViewAdaptor(content)
    }
    
    public var body: some View {
        _adaptor
    }
}
