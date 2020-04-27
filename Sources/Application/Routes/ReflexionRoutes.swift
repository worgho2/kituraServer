//
//  ReflexionRoutes.swift
//  Application
//
//  Created by otavio on 16/04/20.
//

import Foundation
import LoggerAPI
import Kitura

func initializeReflexionRoutes(app: App) {
    app.router.post("/reflexion", handler: createReflexion)
    app.router.get("/reflexion", handler: readReflexion)
    app.router.get("/reflexion/all", handler: readAllReflexions)
    app.router.delete("/reflexion", handler: deleteReflexion)
    app.router.put("/reflexion", handler: updateReflexion)
}

func createReflexion(reflexion: Reflexion, respondWith: @escaping(Reflexion?, RequestError?) -> Void) {
    var storeEntry = reflexion
    storeEntry.id = UUID().uuidString
    storeEntry.created_at = Date()
    storeEntry.modified_at = storeEntry.created_at
    
    storeEntry.save(respondWith)
}

func readAllReflexions(respondWith: @escaping([Reflexion]?, RequestError?) -> Void) {
    Reflexion.findAll(respondWith)
}

func readReflexion(params: AllRelflexionsParams, respondWith: @escaping([Reflexion]?, RequestError?) -> Void) {
    Reflexion.findAll(matching: params, respondWith)
}

func deleteReflexion(id: String, respondWith: @escaping(RequestError?) -> Void) {
    Reflexion.delete(id: id, respondWith)
}

func updateReflexion(id: String, reflexion: Reflexion, respondWith: @escaping(Reflexion?, RequestError?) -> Void) {
    reflexion.update(id: id, respondWith)
}
