//
//  SUICoordinator.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import WebKit
import SwiftUI

@Observable
open final class SUICoordinator: NSObject {

    open typealias ID = SUIWebViewRoot.ID

    internal var root: SUIWebViewRoot

    open let id: ID

    open init(_ root: SUIWebViewRoot) {
        self.id = root.id
        self.root = root
        super.init()
        Self.insert(self)
    }
}
