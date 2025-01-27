//
//  MovieResponse.swift
//  Examen iOS
//
//  Created by Tardes on 27/01/2025.
//

import Foundation

struct MovieResponse: Codable {
    let search: [Movie]
    let response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response = "Response"
    }
}

struct Movie: Codable {
    let imdbID: String
    let title: String
    let year: String?
    let poster: String
    let plot: String?
    let runtime: String?
    let director: String?
    let genre: String?
    let country: String?
    let response: String?

    enum CodingKeys: String, CodingKey {
        case imdbID = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case plot = "Plot"
        case runtime = "Runtime"
        case director = "Director"
        case genre = "Genre"
        case country = "Country"
        case response = "Response"
    }
}
