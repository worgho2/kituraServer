//
//  DataAccessObject.swift
//  Application
//
//  Created by otavio on 17/04/20.
//

import Foundation

protocol DataAccessObject {
    func createReflexion(object: Reflexion) -> Bool
    func readReflexion(id: String) -> Reflexion?
    func updateReflexion(id: String, to: Reflexion) -> Bool
    func deleteReflexion(id: String) -> Bool
}
