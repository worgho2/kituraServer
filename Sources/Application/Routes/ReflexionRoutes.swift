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
    
    func createReflexion(reflexion: Reflexion, respondWith: @escaping(Reflexion?, RequestError?) -> Void) {
        if app.dataAccessObject.createReflexion(object: reflexion) {
            respondWith(reflexion, nil)
        } else {
            respondWith(nil, .alreadyReported)
        }
    }
    
    func readReflexion(params: ReflexionParams, respondWith: @escaping(Reflexion?, RequestError?) -> Void) {
        if let id = params.id {
            let response = app.dataAccessObject.readReflexion(id: id)
            respondWith(response, nil)
        } else {
            respondWith(nil, nil)
        }
    }
    
    func deleteReflexion(id: String, respondWith: @escaping(RequestError?) -> Void) {
        if app.dataAccessObject.deleteReflexion(id: id) {
            respondWith(nil)
        } else {
            respondWith(.notFound)
        }
    }
    
    app.router.post("/reflexion", handler: createReflexion)
    app.router.get("/reflexion", handler: readReflexion)
    app.router.delete("/reflexion", handler: deleteReflexion)
    
}
