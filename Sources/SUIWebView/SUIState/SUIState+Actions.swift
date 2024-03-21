//
//  SUIState+Actions.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import Foundation

extension SUIState {

    public func load(_ newQuery: String? = nil) {
        self.query = newQuery ?? self.query
        self.flag = .load
    }

    public func stop() { self.flag = .stop }

    public func reload() { self.flag = .reload }

    public func reloadForce() { self.flag = .reloadForce }

    public func goBack() { self.flag = .back }

    public func goForward() { self.flag = .forward }

    @discardableResult
    public func idle() -> SUIFlag {
        let flag = self.flag
        self.flag = .none
        return flag
    }

}
