// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation



struct PokemonModel: Codable {
    let count: Int?
    let next: String?
    let results: [ResultPokemon]?
}

// MARK: - Result
struct ResultPokemon: Codable, Hashable {
    let name: String?
    let url: String?
}

// MARK: - Welcome
struct PokemonInfomation: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let cries: Cries?
    let forms: [Species]?
    let gameIndices: [GameIndex]?
    let height: Int?
    let heldItems: [HeldItem]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [Move]?
    let name: String?
    let order: Int?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries
        case forms
        case gameIndices = "game_indices"
        case id
        case height
        case moves
        case name
        case order
        case species
        case sprites
        case stats
        case types
        case weight
        case heldItems = "held_items"
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
    }

}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?
    
    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case ability
        case slot
    }
}

// MARK: - Species
struct Species: Codable, Hashable {
    let name: String?
    let url: String?
}

// MARK: - Cries
struct Cries: Codable {
    let latest, legacy: String?
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int?
    let version: Species?
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: - HeldItem
struct HeldItem: Codable {
    let item: Species?
    let versionDetails: [VersionDetail]?
    
    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

// MARK: - VersionDetail
struct VersionDetail: Codable {
    let rarity: Int?
    let version: Species?
}

// MARK: - Move
struct Move: Codable {
    let move: Species?
    let versionGroupDetails: [VersionGroupDetail]?
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int?
    let moveLearnMethod, versionGroup: Species?
}




// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld?
    let home: Home?
    let officialArtwork: OfficialArtwork?
    
}

// MARK: - Sprites
struct Sprites: Codable {
    let backDefault: String?
    
    let backShiny: String?
   
    let frontDefault: String
 
    let frontShiny: String
   
    let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other
    }

}

// MARK: - GenerationI
struct GenerationI: Codable {
    let redBlue, yellow: RedBlue?
}

// MARK: - RedBlue
struct RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String?
    let frontGray, frontTransparent: String?
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    let crystal: Crystal?
    let gold, silver: Gold?
}

// MARK: - Crystal
struct Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String?
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
}

// MARK: - Gold
struct Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String?
    let frontTransparent: String?
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: OfficialArtwork?
    let fireredLeafgreen, rubySapphire: Gold?
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String?
}

// MARK: - Home
struct Home: Codable {
    let frontDefault: String?
    
    let frontShiny: String?

}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    let icons: DreamWorld?
    let ultraSunUltraMoon: Home?
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String?
  
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    let icons: DreamWorld?
}

// MARK: - Stat
struct Stat: Codable, Identifiable {
    let id = UUID().uuidString
    let baseStat, effort: Int?
    let stat: Species?
    
    enum CodingKeys: String, CodingKey {
        case id
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable, Hashable {
    let slot: Int?
    let type: Species?
}


struct Translation: Codable {
    let num: Int?
    let ja, en: String?
}
