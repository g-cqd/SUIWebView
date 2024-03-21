//
//  SUIState.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import SwiftUI
import OSLog
import WebKit

@Observable
open final class SUIState {

    open internal(set) var root: SUIWebViewRoot? = nil
    open internal(set) var flag: SUIFlag = .none

    open var query: String = ""

    // MARK: -WKWebView State
    open var title: String?                       /* { get } */
    open var url: URL?                            /* { get } */
    open var mediaType: String?                   /* { get } */
    open var customUserAgent: String?             /* { get set } */
    open var serverTrust: SecTrust?               /* { get } */
    open var hasOnlySecureContent: Bool?          /* { get } */
    open var themeColor: UIColor?                 /* { get } */
    open var underPageBackgroundColor: UIColor?   /* { get set } */

    // MARK: -WKWebView Navigation State
    open var canGoBack: Bool?                     /* { get } */
    open var canGoForward: Bool?                  /* { get } */
    open var estimatedProgress: Double?           /* { get } */
    open var backForwardList: WKBackForwardList?  /* { get } */

    @ObservationIgnored
    internal var values: [Int:Int] = [:]

    internal var configurations: [Int:SUIWebViewRoot.Configuration] = [:]

    open init(insert: Bool = false) {
        if insert {
            Self.insert(self)
        }
    }

    open init(query: String, insert: Bool = false) {
        self.query = query
        self.flag = .load
        if insert {
            Self.insert(self)
        }
    }

    open init(query: String, action: SUIFlag, insert: Bool = false) {
        self.query = query
        self.flag = action
        if insert {
            Self.insert(self)
        }
    }

}

// MARK: - Public Methods
extension SUIState {

    open func update(from uiView: WKWebView) {
        self.query = uiView.url?.absoluteString ?? self.query
        self.canGoBack = uiView.canGoBack
        self.canGoForward = uiView.canGoForward
        self.estimatedProgress = uiView.estimatedProgress
        self.mediaType = uiView.mediaType
        self.title = uiView.title
        self.customUserAgent = uiView.customUserAgent
        self.serverTrust = uiView.serverTrust
        self.hasOnlySecureContent = uiView.hasOnlySecureContent
        self.themeColor = uiView.themeColor
        self.backForwardList = uiView.backForwardList
    }

}
