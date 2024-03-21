//
//  SUIWebViewRoot.swift
//  SUIWebViewRoot
//
//  Created by Guillaume Coquard on 19/03/24.
//

import SwiftUI
import WebKit
import OSLog

open struct SUIWebViewRoot {

    open typealias UIViewType = SUIWKView
    open typealias Coordinator = SUICoordinator
    open typealias ID = UIViewType.ID

    internal var uiView: UIViewType
    internal var state: Binding<SUIState>
    internal var unwrapped: SUIState { self.state.wrappedValue }

    open let id: ID

    open init(_ state: Binding<SUIState>) {
        let view = SUIWKView(frame: .zero, configuration: .init())
        let id = view.id
        self.uiView = view
        self.id = id
        self.state = state
    }

    open init(_ state: Binding<SUIState>, with configuration: WKWebViewConfiguration) {
        let view = SUIWKView(frame: .zero, configuration: configuration)
        let id = view.id
        self.uiView = view
        self.id = id
        self.state = state
    }

}
