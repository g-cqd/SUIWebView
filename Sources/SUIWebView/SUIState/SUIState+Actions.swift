//
//  SUIState+Actions.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import Foundation

extension SUIState {

    open func load(_ newQuery: String? = nil) {
        self.query = newQuery ?? self.query
        self.flag = .load
    }

    open func stop() { self.flag = .stop }

    open func reload() { self.flag = .reload }

    open func reloadForce() { self.flag = .reloadForce }

    open func goBack() { self.flag = .back }

    open func goForward() { self.flag = .forward }

    @discardableResult
    open func idle() -> SUIFlag {
        let flag = self.flag
        self.flag = .none
        return flag
    }

}
