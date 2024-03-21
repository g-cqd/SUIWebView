//
//  SUIWebView.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 20/03/24.
//

import SwiftUI
import OSLog

public struct SUIWebView: View {

    static private let logger: Logger = .init()

    @State public var state: SUIState

    public init(_ state: SUIState = .create()) {
        self.state = state
    }

    public var body: some View {
        SUIWebViewRoot($state)
    }
}

extension SUIWebView {
    public func set<A:Hashable>(
        _ path: ReferenceWritableKeyPath<SUIWKView,A>,
        to value: A
    ) -> Self {
        let pathHash = path.hashValue
        let valueHash = value.hashValue
        let maybe = self.state.values[pathHash]
        if maybe == nil || maybe! != valueHash {
            self.state.values.updateValue(valueHash, forKey: pathHash)
            self.state.configurations
                .updateValue({ (view: SUIWKView?) in view?[keyPath: path] = value }, forKey: pathHash)
        }
        return self
    }
    
    public func set<A:Hashable, B:Hashable>(
        _ path: ReferenceWritableKeyPath<SUIWKView,B>,
        computing action: @escaping (A?) -> B?
    ) -> Self {
        let pathHash = path.hashValue
        let value: B? = action(state.root?.uiView[keyPath: path] as? A)
        let valueHash = value.hashValue
        let maybe = self.state.values[pathHash]
        if (maybe == nil || maybe! != valueHash) && value != nil {
            self.state.values.updateValue(valueHash, forKey: pathHash)
            self.state.configurations
                .updateValue({ (view: SUIWKView?) in view?[keyPath: path] = value! }, forKey: pathHash)
        }
        return self
    }
}
