//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Isabel Nelson on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let backgroundGradient = LinearGradient(
            colors: [Color.indigo, Color.white],
            startPoint: .top, endPoint: .bottom)
        
        let moves = ["rock", "paper", "scissors"]
        var win = true
        @State var selection = Int.random(in: 0...2)
        @State var score = 0
        
        VStack {
            VStack (spacing: 30) {
                Text(win == true ? "Play to Win!" : "Play to Lose!")
                Button("🪨") {}
                Button("📃") {}
                Button("✂️") {}
                Text("Score: \(score)")
            }
            .frame(maxWidth: 300, maxHeight: 500)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
        }
        .buttonStyle(.bordered)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundGradient)
        .foregroundStyle(.white)
        .tint(.indigo)
    }
}

#Preview {
    ContentView()
}
