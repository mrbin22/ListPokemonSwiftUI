//
//  HomeView.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = PokemonManager()
    var body: some View {
        NavigationStack {
            
            ScrollView(showsIndicators: false) {
                
                Image("poke_ball")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        vm.nameJapanese.removeAll()
                        Task {
                            await vm.getDatas()
                            vm.nameJapanese = vm.nameJapanese.reversed()
                        }
                    }
                
                if let results = vm.results {
                    ForEach(Array(results.enumerated()), id: \.element.self) { index, result in
                        NavigationLink {
                            if index < vm.nameJapanese.count {
                                PokemonDetailView(url: result.url ?? "", name: vm.nameJapanese[index])
                            } else {
                                Text("Loading...")
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { }
                                    }
                            }
                        } label: {
                            HStack {
                                ImagePokemonView(url: result.url ?? "")
                                    .frame(width: 150, height: 150)
                                if index < vm.nameJapanese.count {
                                    Text(vm.nameJapanese[index])
                                        .font(.headline)
                                } else {
                                    Text("Loading...")
                                        .onAppear {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                
                                            }
                                        }
                                }
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.yellow.opacity(0.7).cornerRadius(20))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke()
                                    .fill(Color.green)
                            )
                        }
                        .onAppear {
                            // 日本語を変換する
                            let temp = vm.translateWord(word: result.name ?? "", from: vm.translations)
                            vm.nameJapanese.append(temp)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
