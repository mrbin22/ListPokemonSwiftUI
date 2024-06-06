//
//  PokemonInfomationView.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import SwiftUI
import Charts

struct PokemonInfomationView: View {
    var abilities: [Ability]?
    var height: Int?
    var weight: Int?
    var types: [TypeElement]?
    var stats: [Stat]?
    let rows = [GridItem(.flexible()), GridItem(.flexible())]
    @State var isAnimate: Bool = false
    var dic: [String : String] = [
        "hp" : "HP",
        "attack" : "攻撃",
        "defense" : "防御",
        "special-attack" : "特攻撃",
        "special-defense" : "特防",
        "speed" : "素早さ"]
    var body: some View {
            ScrollView {
                HStack(spacing: 100) {
                        VStack() {
                            Text("身長")
                                .font(.title3)
                                .foregroundStyle(Color.white)
                                .padding()
                                .background(
                                    Ellipse()
                                        .fill(Color.purple)
                                )
                            
                            Text("\(height ?? 10)")
                                .font(.headline)
                        }
                        
                        VStack {
                            Text("体重")
                                .font(.title3)
                                .foregroundStyle(Color.white)
                                .padding()
                                .background(
                                    Ellipse()
                                        .fill(Color.pink)
                                    
                                )
                            
                            Text("\(weight ?? 20)")
                                .font(.headline)
                        }
                    }

                
                
                HStack(spacing: 50) {
                    Text("種類")
                        .font(.title3)
                        .foregroundStyle(Color.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.orange.opacity(0.8))
                        )
     
                    
                    if let types = types {
                        ForEach(types, id: \.self) { type in
                            Text(type.type?.name ?? "")
                                .foregroundStyle(Color.white)
                                .font(.headline)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.8))
                                )
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                
                VStack {
                    Text("統計")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo.cornerRadius(10))
                        .padding(.horizontal, 20)
            
//                    HStack(spacing: 60) {
//                        if let stats = stats {
//                            VStack(alignment: .center) {
//                                
//                                Text((stats[0].stat?.name?.uppercased() ?? ""))
//                                Text("\(stats[0].baseStat ?? 0)")
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.yellow)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                                    .frame(height: 10)
//                                    .scaleEffect(x: isAnimate ? 1 : 0, y: 1, anchor: .leading)
//                                    .animation(.easeOut(duration: 1.5), value: isAnimate)
//                                    .padding(.horizontal, 10)
//                            }
//                            .frame(width: 70, height: 100)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.green)
//                                    .stroke(Color.red, lineWidth: 1, antialiased: false)
//                            )
//                            
//                            VStack {
//                                
//                                Text("攻撃")
//                                Text("\(stats[1].baseStat ?? 0)")
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.yellow)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                                    .frame(height: 10)
//                                    .scaleEffect(x: isAnimate ? 1 : 0, y: 1, anchor: .leading)
//                                    .animation(.easeOut(duration: 1.5), value: isAnimate)
//                                    .padding(.horizontal, 10)
//                            }
//                            .frame(width: 70, height: 100)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.green)
//                                    .stroke(Color.red, lineWidth: 1, antialiased: false)
//                            )
//                            
//                            VStack {
//                                
//                                Text("防御")
//                                Text("\(stats[2].baseStat ?? 0)")
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.yellow)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                                    .frame(height: 10)
//                                    .scaleEffect(x: isAnimate ? 1 : 0, y: 1, anchor: .leading)
//                                    .animation(.easeOut(duration: 1.5), value: isAnimate)
//                                    .padding(.horizontal, 10)
//                            }
//                            .frame(width: 70, height: 100)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.green)
//                                    .stroke(Color.red, lineWidth: 1, antialiased: false)
//                            )
//                        }
//                    }
//                    
//                    HStack(spacing: 60) {
//                        if let stats = stats {
//                            VStack {
//                               
//                                Text("特攻撃")
//                                Text("\(stats[3].baseStat ?? 0)")
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.yellow)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                                    .frame(height: 10)
//                                    .scaleEffect(x: isAnimate ? 1 : 0, y: 1, anchor: .leading)
//                                    .animation(.easeOut(duration: 1.5), value: isAnimate)
//                                    .padding(.horizontal, 10)
//                            }
//                            .frame(width: 70, height: 100)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.green)
//                                    .stroke(Color.red, lineWidth: 1, antialiased: false)
//                            )
//                            
//                            VStack {
//                                
//                                Text("特防")
//                                Text("\(stats[4].baseStat ?? 0)")
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.yellow)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                                    .frame(height: 10)
//                                    .scaleEffect(x: isAnimate ? 1 : 0, y: 1, anchor: .leading)
//                                    .animation(.easeOut(duration: 1.5), value: isAnimate)
//                                    .padding(.horizontal, 10)
//                            }
//                            .frame(width: 70, height: 100)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.green)
//                                    .stroke(Color.red, lineWidth: 1, antialiased: false)
//                            )
//                            
//                            VStack {
//                                
//                                Text("素早さ")
//                                Text("\(stats[5].baseStat ?? 0)")
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.yellow)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                                    .frame(height: 10)
//                                    .scaleEffect(x: isAnimate ? 1 : 0, y: 1, anchor: .leading)
//                                    .animation(.easeOut(duration: 1.5), value: isAnimate)
//                                    .padding(.horizontal, 10)
//                            }
//                            .frame(width: 70, height: 100)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.green)
//                                    .stroke(Color.red, lineWidth: 1, antialiased: false)
//                            )
//                        }
//                    }

                }
                Chart {
                    ForEach(stats ?? []) { stat in
                        BarMark(x: .value("describe", dic[stat.stat?.name ?? ""] ?? "")
                                ,
                                y: .value("value", isAnimate ? stat.baseStat ?? 0 : 0))
                        .annotation(position: .top, content: {
                            Text("\(stat.baseStat ?? 0)")
                        })
                        .foregroundStyle(Color.green.opacity(0.9))
                        
                    }
                }
                
                .chartYAxis(.hidden)
                .chartXAxis {
                    AxisMarks(position: .bottom) {
                        AxisValueLabel()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .animation(.easeOut(duration: 2.0), value: isAnimate)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isAnimate = true
                    }
                }
                
            }
            .padding(.top, 10)
            }
        }
#Preview {
    PokemonInfomationView()
}



