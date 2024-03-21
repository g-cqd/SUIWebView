//
//  SUICoordinator.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import WebKit
import SwiftUI

@Observable
public final class SUICoordinator: NSObject {

    public typealias ID = SUIWebViewRoot.ID

    internal var root: SUIWebViewRoot

    public let id: ID

    public init(_ root: SUIWebViewRoot) {
        self.id = root.id
        self.root = root
        super.init()
        Self.insert(self)
    }
}
