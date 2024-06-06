//
//  PokemonDetailViewModel.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var infomation: PokemonInfomation?
    
    
    func getInfo(url: String) async {
        guard let url = URL(string: url) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(PokemonInfomation.self, from: data)
            DispatchQueue.main.sync {
                self.infomation = jsonData
                //print(infomation)
            }
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
