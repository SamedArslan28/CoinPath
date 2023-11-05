//
//  CoinError.swift
//  CoinPath
//
//  Created by Abdulsamed Arslan on 6.11.2023.
//

import Foundation

enum CoinError: Error, LocalizedError{

    case invalidURL
    case serverError
    case invalidData
    case unkown(Error)

    var errorDescription: String?
    {
        switch self {
        case .invalidURL:
            "invalid Url"
        case .serverError:
            "Bad request"
        case .invalidData:
            "Caoin data is invalid"
        case .unkown(let error):
            error.localizedDescription
        }
    }

}
