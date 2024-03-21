//
//  +WKNavigationDelegate.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import WebKit

// MARK: - WKNavigationDelegate
extension SUICoordinator: WKNavigationDelegate {

    func webView(
        _ webView: WKWebView,
        didStartProvisionalNavigation navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didStartProvisionalNavigation")
    }

    func webView(
        _ webView: WKWebView,
        didFailProvisionalNavigation navigation: WKNavigation!,
        withError error: any Error
    ) {
        Self.logger.warning("(SUICoordinator) didFailProvisionalNavigation\n\(String(describing: error))")
        self.idle()
    }

    func webView(
        _ webView: WKWebView,
        didCommit navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didCommit")
    }

    func webView(
        _ webView: WKWebView,
        didFail navigation: WKNavigation!,
        withError error: any Error
    ) {
        Self.logger.warning("(SUICoordinator) didFail\n\(String(describing: error))")
        self.idle()
    }

    func webView(
        _ webView: WKWebView,
        didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didReceiveServerRedirectForProvisionalNavigation")
    }

    func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) {
        Self.logger.info("(SUICoordinator) didFinish")
        self.idle()
    }

}
