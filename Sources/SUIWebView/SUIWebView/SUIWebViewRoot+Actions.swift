//
//  +Actions.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import WebKit

extension SUIWebViewRoot {

    open func request() -> URLRequest? {
        return if !unwrapped.query.isEmpty {
            URLRequest(url: URL(string: unwrapped.query)!)
        } else {
            nil
        }
    }

    open func load(_ query: String? = nil) {
        unwrapped.load(query ?? unwrapped.query)
    }

    open func stop() {
        unwrapped.stop()
    }

    open func goBack() {
        unwrapped.goBack()
    }

    open func goForward() {
        unwrapped.goForward()
    }

    open func reload() {
        unwrapped.reload()
    }

    open func reloadForce() {
        unwrapped.reloadForce()
    }

    open func update(from uiView: WKWebView) {
        unwrapped.update(from: uiView)
    }

    open func idle() -> SUIFlag {
        unwrapped.idle()
    }

}
