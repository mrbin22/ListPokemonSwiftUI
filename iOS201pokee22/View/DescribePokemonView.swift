//
//  DescribePokemonView.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/05/06.
//

import SwiftUI

struct DescribePokemonView: View {
    @StateObject var vm = DescribePokemonViewModel()
    var url: String
    init(url: String) {
        self.url = url
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(3), Color.green, Color.orange.opacity(1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("ポケモンの語り")
                    .font(.largeTitle)
                    .bold()
                
                Text(vm.getStory())
                    .foregroundStyle(.white)
                    .font(.title)
            }
                
        }
        .onAppear {
            
            Task {
                try await vm.getData(url: url)
            }
        }
    }
}

#Preview {
    DescribePokemonView(url: "")
}
