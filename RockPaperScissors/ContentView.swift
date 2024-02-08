//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Isabel Nelson on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    let backgroundGradient = LinearGradient(
        colors: [Color.indigo, Color.white],
        startPoint: .top, endPoint: .bottom)
    let moves = ["🪨", "📃", "✂️"]
    
    @State private var tryToWin = true
    @State private var selection = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingResult = false
    @State private var showingFinalResult = false
    @State private var winOrLose = "Lose"
    @State private var questionNumber = 0
    
    var body: some View {
        VStack {
            VStack (spacing: 30) {
                Text(tryToWin == true ? "Play to Win!" : "Play to Lose!")
                Button("🪨") {
                    if (tryToWin == true && selection == 2) || (tryToWin == false && selection == 1) {
                        score += 1
                        winOrLose = "Win"
                    } else if selection == 0 {
                        winOrLose = "Tied"
                    }
                    showingResult = true
                }
                Button("📃") {
                    if (tryToWin == true && selection == 0) || (tryToWin == false && selection == 2) {
                        score += 1
                        winOrLose = "Win"
                    } else if selection == 1 {
                        winOrLose = "Tied"
                    }
                    showingResult = true
                }
                Button("✂️") {
                    if (tryToWin == true && selection == 1) || (tryToWin == false && selection == 0) {
                        score += 1
                        winOrLose = "Win"
                    } else if selection == 2 {
                        winOrLose = "Tied"
                    }
                    showingResult = true
                }
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
        .alert("Round Result:", isPresented: $showingResult) {
            Button("Next") {
                resetTurn()
            }
        } message: {
            VStack {
                Text("Your oponent chose the \(moves[selection]) \nYou \(winOrLose)")
            }
        }
        .alert("Final Result:", isPresented: $showingFinalResult) {
            Button("Play Again") {
                resetGame()
            }
        } message: {
            VStack {
                Text("Your final score is \(score)")
            }
        }
    }
    
    func resetTurn() {
        tryToWin.toggle()
        selection = Int.random(in: 0...2)
        winOrLose = "Lose"
        questionNumber += 1
        
        if questionNumber >= 10 {
            showingFinalResult = true
        }
    }
    
    func resetGame() {
        selection = Int.random(in: 0...2)
        winOrLose = "Lose"
        questionNumber = 0
        score = 0
    }
}

#Preview {
    ContentView()
}
