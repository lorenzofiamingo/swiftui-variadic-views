import SwiftUI

/// A view that represents the collection of views of the `VariadicView` content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct VariadicViewChildren {
    
    private let _children: _VariadicView.Children
    
    init(_ children: _VariadicView.Children) {
        self._children = children
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension VariadicViewChildren: View {
    
    public var body: some View {
        _children
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension VariadicViewChildren: RandomAccessCollection {
    
    /// A single element within the collection, conforming to `View` and `Identifiable`.
    public struct Element: View, Identifiable {
        
        private var _element: _VariadicView.Children.Element
        
        init(_ element: _VariadicView.Children.Element) {
            self._element = element
        }
        
        public var id: AnyHashable {
            _element.id
        }
        
        func id<ID: Hashable>(as _: ID.Type = ID.self) -> ID? {
            _element.id(as: ID.self)
        }
        
        public subscript<Trait: ViewTraitKey>(key: Trait.Type) -> Trait.Value {
            get {
                _element[key]
            } set {
                _element[key] = newValue
            }
        }
        
        public var body: some View {
            _element
        }
    }
    
    public var startIndex: Int {
        _children.startIndex
    }
    
    public var endIndex: Int {
        _children.endIndex
    }
    
    public subscript(index: Swift.Int) -> Element {
        Element(_children[index])
    }
}
