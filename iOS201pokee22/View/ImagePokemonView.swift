//
//  ImagePokemonView.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import SwiftUI

struct ImagePokemonView: View {
    @StateObject var vm = ImagePokemonViewModel()
    var url: String
    var body: some View {
        VStack {
            if let info = URL(string: vm.images?.sprites?.frontDefault ?? "") {
                AsyncImage(url: info) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                await vm.getInfo(url: self.url)
            }
        }
    }
}

#Preview {
    ImagePokemonView(url: "https://pokeapi.co/api/v2/pokemon/2/")
}
