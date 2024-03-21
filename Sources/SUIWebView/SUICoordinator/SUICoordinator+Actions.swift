//
//  +Actions.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import WebKit

extension SUICoordinator {

    public func load(_ newQuery: String) {
        self.root.load(newQuery)
    }

    public func reload() { self.root.reload() }

    public func reloadForce() { self.root.reloadForce() }

    public func goBack() { self.root.goBack() }

    public func goForward() { self.root.goForward() }

    public func stop() { self.root.stop() }

    @discardableResult
    public func idle() -> SUIFlag {
        self.root.idle()
    }

    public func update(from uiView: WKWebView) {
        self.root.update(from: uiView)
    }
}
