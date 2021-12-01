//
//  HeadlinesModel.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import Foundation

// MARK: - Headlines
struct Headlines: Codable {
    let status: String
   let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case techcrunch = "techcrunch"
}

enum Name: String, Codable {
    case techCrunch = "TechCrunch"
}
