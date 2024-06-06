//
//  PokemonManager.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import Foundation

class PokemonManager: ObservableObject {
    @Published var pokemons: PokemonModel?
    @Published var results: [ResultPokemon]?
    @Published var pokemonInfomation: PokemonInfomation?
    @Published var pokemonInfomations: [PokemonInfomation] = []
    @Published var translations: [Translation] = []
    @Published var nameJapanese: [String] = []
    @Published var pokemonSpecie: PokemonSpeciesModel?
    @Published var pokemonSpecies: [PokemonSpeciesModel] = []
    
    init() {
        loadJsonFile(fileName: "pokemon_name_converter")
    }
    
    func getDatas() async {
        let random = Int.random(in: 0...1298)
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=\(random)&limit=5") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(PokemonModel.self, from: data)
            DispatchQueue.main.sync {
                self.pokemons = jsonData
                self.results = jsonData.results
                //print(results)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    func loadJsonFile(fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Translation].self, from: data)
                self.translations = jsonData
            } catch {
                print("Error loading JSON data: \(error.localizedDescription)")
            }
        }
    }
    
    
    func translateWord(word: String, from translations: [Translation]) -> String {
        let translation = translations.first(where: { $0.en?.lowercased() == word.lowercased() })
        //print(translation?.ja)
        return translation?.ja ?? ""
    }
    
    func getDataPokemonSpecies(url: String?) async {
        guard let url = URL(string: url ?? "") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(PokemonSpeciesModel.self, from: data)
            DispatchQueue.main.sync {
                self.pokemonSpecie = jsonData
                if let pokemonSpecie = pokemonSpecie {
                    pokemonSpecies.append(pokemonSpecie)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDataPokemonInfomation(url: String?) async {
        guard let url = URL(string: url ?? "") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(PokemonInfomation.self, from: data)
            DispatchQueue.main.sync {
                self.pokemonInfomation = jsonData
                if let pokemonInfomation = pokemonInfomation {
                    pokemonInfomations.append(pokemonInfomation)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
