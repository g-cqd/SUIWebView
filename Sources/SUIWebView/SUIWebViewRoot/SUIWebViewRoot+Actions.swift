//
//  +Actions.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import WebKit

extension SUIWebViewRoot {

    public func request() -> URLRequest? {
        return if !unwrapped.query.isEmpty {
            URLRequest(url: URL(string: unwrapped.query)!)
        } else {
            nil
        }
    }

    public func load(_ query: String? = nil) {
        unwrapped.load(query ?? unwrapped.query)
    }

    public func stop() {
        unwrapped.stop()
    }

    public func goBack() {
        unwrapped.goBack()
    }

    public func goForward() {
        unwrapped.goForward()
    }

    public func reload() {
        unwrapped.reload()
    }

    public func reloadForce() {
        unwrapped.reloadForce()
    }

    public func update(from uiView: WKWebView) {
        unwrapped.update(from: uiView)
    }

    public func idle() -> SUIFlag {
        unwrapped.idle()
    }

}
