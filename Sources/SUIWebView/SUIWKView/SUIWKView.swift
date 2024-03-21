//
//  SUIWKView.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import WebKit

open final class SUIWKView: WKWebView {

    open typealias ID = UUID
    
    open let id: SUIWKView.ID

    override open init(frame: CGRect = .zero, configuration: WKWebViewConfiguration) {
        self.id = .init()
        super.init(frame: frame, configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SUIWKView {

    internal func connect() -> Self? {

        guard let delegate = SUICoordinator.get(for: self.id) else {
            return nil
        }

        self.uiDelegate = delegate
        self.navigationDelegate = delegate
        self.scrollView.delegate = delegate

        return self
    }

}
