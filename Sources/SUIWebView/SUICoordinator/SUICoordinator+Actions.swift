//
//  +Actions.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import WebKit

extension SUICoordinator {

    open func load(_ newQuery: String) {
        self.root.load(newQuery)
    }

    open func reload() { self.root.reload() }

    open func reloadForce() { self.root.reloadForce() }

    open func goBack() { self.root.goBack() }

    open func goForward() { self.root.goForward() }

    open func stop() { self.root.stop() }

    @discardableResult
    open func idle() -> SUIFlag {
        self.root.idle()
    }

    open func update(from uiView: WKWebView) {
        self.root.update(from: uiView)
    }
}
