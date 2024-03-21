//
//  +UIViewRepresentable.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import SwiftUI
import Algorithms
import Collections

// MARK: - UIViewRepresentable
extension SUIWebViewRoot: UIViewRepresentable {

    open typealias Configuration = (SUIWKView?) -> Void

    private func composeConfiguration(_ functions: [Configuration]) -> Configuration {
        ({ (value: SUIWKView?) in
            for function in functions {
                function( value )
            }
        })
    }
    
    private func configure(_ uiView: SUIWKView?) {
        composeConfiguration(Array(unwrapped.configurations.values))(uiView)
    }

    public func makeUIView(context: Context) -> SUIWKView {

        guard let connected = uiView.connect() else {
            Self.logger.critical("(SUIWebViewRoot) uiView has not been connected to its delegate.")
            return uiView
        }

        configure(connected)

        if unwrapped.flag == .load {
            if let request = request() {
                connected.load(request)
            }
        }

        return connected
    }

    public func updateUIView(_ uiView: SUIWKView, context: Context) {

        configure(uiView)
        
        if unwrapped.flag != .none {
            switch unwrapped.flag {
                case .load:
                    if let request = self.request() {
                        uiView.load(request)
                    }
                case .back:
                    uiView.goBack()
                case .forward:
                    uiView.goForward()
                case .reload:
                    uiView.reload()
                case .reloadForce:
                    uiView.reloadFromOrigin()
                case .stop:
                    uiView.stopLoading()
                default:
                    break
            }
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
