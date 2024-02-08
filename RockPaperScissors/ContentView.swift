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
    
    // Variable determines "Play to Win!" or "Play to Lose!" title
    @State private var tryToWin = true
    
    // Variable represents phone's rock paper scissors selection
    @State private var selection = Int.random(in: 0...2)
    
    // Variable to keep track of game score
    @State private var score = 0
    
    // Variables for showing alert messages
    @State private var showingResult = false
    @State private var showingFinalResult = false
    
    // Variable to determine if player has lost that turn
    @State private var winOrLose = "Lose"
    
    // Number of turns/questions asked
    @State private var questionNumber = 0
    
    var body: some View {
        VStack {
            VStack (spacing: 30) {
                // Game title
                Text(tryToWin == true ? "Play to Win!" : "Play to Lose!")
                
                // Following three buttons for the game showing rock, paper or scissors
                Button("🪨") {
                    // If you win when supposed to win or lose when supposed to lose, you win the turn
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
        
        // Alert shown after each round
        .alert("Round Result:", isPresented: $showingResult) {
            Button("Next") {
                resetTurn()
            }
        } message: {
            VStack {
                Text("Your oponent chose the \(moves[selection]) \nYou \(winOrLose)")
            }
        }
        
        // Final score alert shown after 10 turns
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
    
    // Function to reset variables between turns
    func resetTurn() {
        tryToWin.toggle()
        selection = Int.random(in: 0...2)
        winOrLose = "Lose"
        questionNumber += 1
        
        if questionNumber >= 10 {
            showingFinalResult = true
        }
    }
    
    // Function to reset the whole game after 10 turns
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
