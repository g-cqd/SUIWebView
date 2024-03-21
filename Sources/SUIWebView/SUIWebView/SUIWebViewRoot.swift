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

    typealias UIViewType = SUIWKView
    typealias Coordinator = SUICoordinator
    typealias ID = UIViewType.ID

    internal var uiView: UIViewType
    internal var state: Binding<SUIState>
    internal var unwrapped: SUIState { self.state.wrappedValue }

    public let id: ID

    init(_ state: Binding<SUIState>) {
        let view = SUIWKView(frame: .zero, configuration: .init())
        let id = view.id
        self.uiView = view
        self.id = id
        self.state = state
    }

    init(_ state: Binding<SUIState>, with configuration: WKWebViewConfiguration) {
        let view = SUIWKView(frame: .zero, configuration: configuration)
        let id = view.id
        self.uiView = view
        self.id = id
        self.state = state
    }

}