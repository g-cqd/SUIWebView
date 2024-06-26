//
//  +Static.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation
import OSLog

// MARK: - Static
extension SUICoordinator {

    static internal var coordinators: [ID: SUICoordinator] = [:]

    @discardableResult
    static public func insert(_ coordinator: SUICoordinator) -> Bool {
        Self.coordinators.updateValue(coordinator, forKey: coordinator.id) != nil
    }

    @discardableResult
    static public func remove(_ id: ID) -> Bool {
        Self.coordinators.removeValue(forKey: id) != nil
    }

    static public func get(for id: ID) -> SUICoordinator? {
        Self.coordinators[id]
    }

    static internal let logger: Logger = .init()

}
