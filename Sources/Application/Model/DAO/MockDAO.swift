//
//  MockDAO.swift
//  Application
//
//  Created by otavio on 17/04/20.
//

import Foundation

class MockDAO: DataAccessObject {
    
    private var reflexions = [Reflexion]()
    
    func createReflexion(object: Reflexion) -> Bool {
        if reflexions.first(where: {$0.id == object.id}) != nil {
            return false
        } else {
            reflexions.append(object)
            return true
        }
    }
    
    func readReflexion(id: String) -> Reflexion? {
        return reflexions.first(where: {$0.id == id})
    }
    
    func updateReflexion(id: String, to: Reflexion) -> Bool {
        if let referenceReflexion = reflexions.first(where: {$0.id == id}) {
            referenceReflexion.text = to.text
            return true
        } else {
            return false
        }
    }
    
    func deleteReflexion(id: String) -> Bool {
        if let index = reflexions.firstIndex(where: {$0.id == id}) {
            reflexions.remove(at: index)
            return true
        } else {
            return false
        }
    }
    
}
