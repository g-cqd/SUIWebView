//
//  +Hashable.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation

// MARK: - Hashable
extension SUIWebViewRoot: Hashable {
    static func == (lhs: SUIWebViewRoot, rhs: SUIWebViewRoot) -> Bool {
        lhs.uiView == rhs.uiView
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.uiView)
    }
}
