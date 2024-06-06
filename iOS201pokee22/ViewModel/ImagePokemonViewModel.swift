//
//  ImagePokemonViewModel.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import Foundation

class ImagePokemonViewModel: ObservableObject {
    @Published var images: PokemonInfomation?
    
    func getInfo(url: String) async {
        guard let url = URL(string: url) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            let jsonData = try JSONDecoder().decode(PokemonInfomation.self, from: data)
            DispatchQueue.main.sync {
                self.images = jsonData
                //print(images)
            }
         } catch let DecodingError.dataCorrupted(context) {
            print(context)
         } catch let DecodingError.keyNotFound(_, context) {
            print("Key '(key)' not found: \(context.debugDescription)")
            print("codingPath: \(context.codingPath)")
         } catch DecodingError.valueNotFound(_, _) {
            print("Value '(value)' not found: (context.debugDescription)")
            print("codingPath: (context.codingPath)")
         } catch DecodingError.typeMismatch(_, _)  {
            print("Type '(type)' mismatch: (context.debugDescription)")
            print("codingPath: (context.codingPath)")
        } catch {
            print("error: (error)")
        }
    }

    
}
