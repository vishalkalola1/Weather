//
//  DatabaseError.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import Foundation

public enum DatabaseError: Error {
    case nodata
    case insertFailed
    case duplicate
    case nodb
 }

extension DatabaseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .nodata:
                return "No data"
            case .insertFailed:
                return "Data does not synced"
            case .duplicate:
                return "Data already exist"
            case .nodb:
                return "Database operation failed"
        }
    }
}
