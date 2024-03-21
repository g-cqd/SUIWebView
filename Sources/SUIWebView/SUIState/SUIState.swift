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
public final class SUIState {

    public internal(set) var root: SUIWebViewRoot? = nil
    public internal(set) var flag: SUIFlag = .none

    public var query: String = ""

    // MARK: -WKWebView State
    public var title: String?                       /* { get } */
    public var url: URL?                            /* { get } */
    public var mediaType: String?                   /* { get } */
    public var customUserAgent: String?             /* { get set } */
    public var serverTrust: SecTrust?               /* { get } */
    public var hasOnlySecureContent: Bool?          /* { get } */
    public var themeColor: UIColor?                 /* { get } */
    public var underPageBackgroundColor: UIColor?   /* { get set } */

    // MARK: -WKWebView Navigation State
    public var canGoBack: Bool?                     /* { get } */
    public var canGoForward: Bool?                  /* { get } */
    public var estimatedProgress: Double?           /* { get } */
    public var backForwardList: WKBackForwardList?  /* { get } */

    @ObservationIgnored
    internal var values: [Int:Int] = [:]

    internal var configurations: [Int:SUIWebViewRoot.Configuration] = [:]

    public init(insert: Bool = false) {
        if insert {
            Self.insert(self)
        }
    }

    public init(query: String, insert: Bool = false) {
        self.query = query
        self.flag = .load
        if insert {
            Self.insert(self)
        }
    }

    public init(query: String, action: SUIFlag, insert: Bool = false) {
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
