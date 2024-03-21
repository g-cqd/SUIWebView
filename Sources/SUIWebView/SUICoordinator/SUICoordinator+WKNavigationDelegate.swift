//
//  +WKNavigationDelegate.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import WebKit

// MARK: - WKNavigationDelegate
extension SUICoordinator: WKNavigationDelegate {

    public func webView(
        _ webView: WKWebView,
        didStartProvisionalNavigation navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didStartProvisionalNavigation")
    }

    public func webView(
        _ webView: WKWebView,
        didFailProvisionalNavigation navigation: WKNavigation!,
        withError error: any Error
    ) {
        Self.logger.warning("(SUICoordinator) didFailProvisionalNavigation\n\(String(describing: error))")
        self.idle()
    }

    public func webView(
        _ webView: WKWebView,
        didCommit navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didCommit")
    }

    public func webView(
        _ webView: WKWebView,
        didFail navigation: WKNavigation!,
        withError error: any Error
    ) {
        Self.logger.warning("(SUICoordinator) didFail\n\(String(describing: error))")
        self.idle()
    }

    public func webView(
        _ webView: WKWebView,
        didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didReceiveServerRedirectForProvisionalNavigation")
    }

    public func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didFinish")
        self.idle()
    }

}
