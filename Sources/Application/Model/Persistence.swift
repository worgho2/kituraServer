//
//  Persistence.swift
//  Application
//
//  Created by otavio on 23/04/20.
//

import Foundation
import SwiftKueryORM
import SwiftKueryPostgreSQL
import LoggerAPI

class Persistence {
    static func setup() {
        let pool = PostgreSQLConnection.createPool (
            host: "localhost", //ProcessInfo.processInfo.environment["DBHOST"] ??
            port: 5432,
            options: [
                .databaseName("kituraServer"),
                .userName("postgres"), //ProcessInfo.processInfo.environment["DBUSER"] ??
                .password("nil"), // ProcessInfo.processInfo.environment["DBPASSWORD"] ??
            ],
            poolOptions: ConnectionPoolOptions(
                initialCapacity: 10,
                maxCapacity: 50,
                timeout: 10000
            )
        )
        
        Database.default = Database(pool)
        
        do {
            try Reflexion.createTableSync()
        } catch let error {
            if let requestError = error as? RequestError, requestError.rawValue == RequestError.ormQueryError.rawValue {
                Log.info("\(Reflexion.tableName) already created")
            } else {
                Log.error(error.localizedDescription)
            }
        }
        
        
    }
}
