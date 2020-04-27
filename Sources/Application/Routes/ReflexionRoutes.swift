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
//    app.router.get("/reflexion/all", handler: readAllReflexions)
    app.router.delete("/reflexion", handler: deleteReflexion)
    app.router.put("/reflexion", handler: updateReflexion)
}

func createReflexion(reflexion: Reflexion, respondWith: @escaping(Reflexion?, RequestError?) -> Void) {
    var storeEntry = reflexion
    storeEntry.id = UUID().uuidString
    storeEntry.createdAt = Date()
    storeEntry.modifiedAt = storeEntry.createdAt
    
    storeEntry.save(respondWith)
}

func readReflexion(respondWith: @escaping([Reflexion]?, RequestError?) -> Void) {
    Reflexion.findAll(respondWith)
}

//func readAllReflexions(params: AllRelflexionsParams, respondWith: @escaping([Reflexion]?, RequestError?) -> Void) {
//    Reflexion.findAll(matching: params, respondWith)
//}

func deleteReflexion(id: String, respondWith: @escaping(RequestError?) -> Void) {
    Reflexion.delete(id: id, respondWith)
}

func updateReflexion(id: String, reflexion: Reflexion, respondWith: @escaping(Reflexion?, RequestError?) -> Void) {
    reflexion.update(id: id, respondWith)
}
