//
//  RandomView.swift
//  ThanksDiary
//
//  Created by usg on 8/13/24.
//


import SwiftUI

struct RandomView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 00) {
                Spacer()
                Text("Luckey Roulette")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.388, saturation: 0.826, brightness: 0.932))
                    .multilineTextAlignment(.center)
                    .padding()
                
                GeometryReader { geometry in
                    VStack(spacing: 20) {
                        Text("🍀")
                            .font(.system(size: geometry.size.width * 0.5))
                            .frame(height: geometry.size.height * 0.4)
                        Spacer()
                        NavigationLink(destination: RandomtitleView()) {
                            Text("The thing that make you lucky")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(hue: 0.349, saturation: 0.751, brightness: 0.751))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                    .navigationTitle("행운주제")
                }
            }
            
            
        }}}
