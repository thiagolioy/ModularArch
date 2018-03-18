//
//  Beer.swift
//  ModelsFramework
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var mmyyyy: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm/yyyy"
        return formatter
    }
}

public struct Beer: Encodable {
    public let id: Int
    public let name: String
    public let tagline: String
    public let firstBrewed: Date
    public let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
    }
    
    
}

extension Beer: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        tagline = try container.decode(String.self, forKey: .tagline)
        
        let dateString = try container.decode(String.self, forKey: .firstBrewed)
        if let date = DateFormatter.mmyyyy.date(from: dateString) {
            firstBrewed = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .firstBrewed,
                                                   in: container,
                                                   debugDescription: "Date string does not match format expected by formatter.")
        }
        
        description = try container.decode(String.self, forKey: .description)
    }
}
