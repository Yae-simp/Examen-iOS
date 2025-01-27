//
//  MovieProvider.swift
//  Examen iOS
//
//  Created by Tardes on 27/01/2025.
//

import Foundation

class MovieProvider {
    
    static func findMovieBy(name: String) async throws -> [Movie] {
        
        let url = URL(string: "https://www.omdbapi.com/?apikey=93600354&s=\(name)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(MovieResponse.self, from: data)
        return result.search
    }
    
    static func findMovieBy(id: String) async throws -> Movie {
        
        let url = URL(string: "https://www.omdbapi.com/?apikey=93600354&i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Movie.self, from: data)
        return result
    }
}
