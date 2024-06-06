//
//  DescribePokemonViewModel.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/05/06.
//

import Foundation

class DescribePokemonViewModel: ObservableObject {
    @Published var info: PokemonSpeciesModel? = nil
    
    
    @MainActor
    func getData(url: String) async throws {
        guard let url = URL(string: url) else { throw URLError(.badURL) }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PokemonSpeciesModel.self, from: data)
                self.info = jsonData
                } catch {
                print(error.localizedDescription)
            }
        }
    
    func getStory() -> String {
        var story = ""
        for i in 0..<(info?.flavorTextEntries?.count ?? 1) {
            if info?.flavorTextEntries?[i].language?.name == "ja" {
                var temp = info?.flavorTextEntries?[i].flavorText ?? "".replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: " ", with: "")
                story = temp
                print(temp)
            }
        }
        return story
    }
    
    }
