//
//  Reflexion.swift
//  Application
//
//  Created by otavio on 16/04/20.
//

import Foundation
import KituraContracts

class Reflexion: Codable {
    let id: String
    let createdAt: Date
    var modifiedAt: Date
    var text: String
}

class ReflexionParams: QueryParams {
    var id: String?
}
