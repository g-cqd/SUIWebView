//
//  +Static.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation
import OSLog

// MARK: - Static
extension SUIState {
    static internal var states: [ID: SUIState] = [:]
    
    static public func create(insert: Bool = false) -> SUIState {
        .init(insert: insert)
    }

    static public func create(query: String, insert: Bool = false) -> SUIState {
        .init(query: query, insert: insert)
    }

    static public func create(query: String, action: SUIFlag, insert: Bool = false) -> SUIState {
        .init(query: query, action: action, insert: insert)
    }

    @discardableResult
    static public func insert(_ state: SUIState) -> Bool {
        Self.states.updateValue(state, forKey: state.id) != nil
    }

    @discardableResult
    static public func remove(_ id: ID) -> Bool {
        Self.states.removeValue(forKey: id) != nil
    }

    static public func get(for id: ID) -> SUIState? {
        Self.states[id]
    }

    static internal let logger: Logger = .init()
}
