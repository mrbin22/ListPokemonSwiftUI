//
//  PokemonDetailView.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject var vm = PokemonDetailViewModel()
    let audioManager = AudioPokemonManager.instance
    var url: String
    var name: String
    @State private var isAnimate: Bool = false
    @State private var isAnimateMusic: Bool = false
    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            NavigationStack {
                        VStack(spacing: 50) {
                            ImagePokemonView(url: url)
                                .frame(width: 200, height: 150)
                                .background(
                                    Circle()
                                        .stroke(lineWidth: 5.0)
                                        .fill(Color.pink.opacity(0.8))
                                        .opacity(isAnimateMusic ? 0 : 1)
                                        .shadow(color: .pink, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                        .scaleEffect(isAnimateMusic ? 1 : 0)
                                        .animation(.spring(), value: isAnimateMusic)
                                )
                                .background(
                                    Image("none_background")
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .opacity(0.3)
                                )
                                
                                .onTapGesture {
                                    audioManager.playSound(url: vm.infomation?.cries?.latest ?? "")
                                    isAnimateMusic.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        isAnimateMusic.toggle()
                                    }
                                }

                            PokemonInfomationView(abilities: vm.infomation?.abilities, height: vm.infomation?.height, weight: vm.infomation?.weight, types: vm.infomation?.types, stats: vm.infomation?.stats)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                                .cornerRadius(10)
                            HStack(spacing: 100) {
                                
                           
                                
                            }
                        }
                        
                    
                    .navigationTitle(name)
                }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        DescribePokemonView(url: vm.infomation?.species?.url ?? "")
                    } label: {
                        Image(systemName: "info.circle")
                            .background(
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 30, height: 30)
                            )
                        
                            
                    }
                }
            }
                .onAppear {
                    Task {
                        await vm.getInfo(url: url)
                    }
            }
        }
        }
    }

#Preview {
    PokemonDetailView(url: "https://pokeapi.co/api/v2/pokemon/1/", name: "Pikachu")
}
