import SwiftUI

/// A named value produced by a view.
///
/// A view with multiple children automatically ignores its children values.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ViewTraitKey: _ViewTraitKey {
    
    /// The type of value produced by this trait.
    associatedtype Value
    
    /// The default value of the trait.
    ///
    /// Views that have no explicit value for the key produce this default
    /// value..
    static var defaultValue: Value { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    /// Sets a value for the given view trait.
    public func trait<K: ViewTraitKey>(key: K.Type, value: K.Value) -> some View {
        _trait(key, value)
    }
}


