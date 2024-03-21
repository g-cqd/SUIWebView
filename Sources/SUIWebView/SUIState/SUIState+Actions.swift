//
//  SUIState+Actions.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import Foundation

extension SUIState {

    func load(_ newQuery: String? = nil) {
        self.query = newQuery ?? self.query
        self.flag = .load
    }

    func stop() { self.flag = .stop }

    func reload() { self.flag = .reload }

    func reloadForce() { self.flag = .reloadForce }

    func goBack() { self.flag = .back }

    func goForward() { self.flag = .forward }

    @discardableResult
    func idle() -> SUIFlag {
        let flag = self.flag
        self.flag = .none
        return flag
    }

}
