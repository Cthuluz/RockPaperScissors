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
        
        var moves = ["rock", "paper", "scissors"]
        var winOrLose = "Play to Win!"
        
        VStack {
            VStack (spacing: 30) {
                Text(winOrLose)
                Button("Rock") {}
                Button("Paper") {}
                Button("Scissors") {}
            }
            .frame(maxWidth: 300, maxHeight: 500)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
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
