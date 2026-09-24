//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Amay Raj Srivastav on 24/09/26.
//

import SwiftUI

struct ButtonView: View {
    let name: String
    let completion: () -> Void
    var body: some View {
        Button(name, action: completion)
            .buttonStyle(.borderedProminent)
            .tint(.teal)
            .font(.system(size: 20))
    }
}

struct ContentView: View {
    
    let items = ["🪨", "📰", "✂️"]
    @State private var appsMove = 0
    @State private var playerChoice = false
    @State private var score = 0
    
    var body: some View {
        VStack{
            Text("Score: \(score)")
                .font(.largeTitle.bold())
            Text("It's a: \(playerChoice ? "Win" : "Lose")")
                .font(.title)
            Text(items[appsMove])
                .font(.system(size: 200))
            HStack(spacing: 48){
                ButtonView(name: "Rock"){
                    checkAnswer(for: items[appsMove], value: playerChoice, with: "rock")
                }
                ButtonView(name: "Paper"){
                    checkAnswer(for: items[appsMove], value: playerChoice, with: "paper")

                }
                ButtonView(name: "Scissor"){
                    checkAnswer(for: items[appsMove], value: playerChoice, with: "scissor")

                }
            }
        }
    }
    
    func askAgain(){
        appsMove = Int.random(in: 0..<3)
        playerChoice = Bool.random()
    }
    
    func checkAnswer(for appMove: String, value playerChoice: Bool, with playerMove: String){
        switch appMove{
        case "🪨":
            if(playerChoice && playerMove == "paper"){
                score += 1
            } else if(!playerChoice && playerMove == "scissor"){
                score += 1
            } else{
                score -= 1
            }
        case "✂️":
            if(playerChoice && playerMove == "rock"){
                score += 1
            } else if(!playerChoice && playerMove == "paper"){
                score += 1
            } else{
                score -= 1
            }
        case "📰":
            if(playerChoice && playerMove == "scissor"){
                score += 1
            } else if(!playerChoice && playerMove == "rock"){
                score += 1
            } else{
                score -= 1
            }
        default:
            score = 0
        }
        askAgain()
    }
}

#Preview {
    ContentView()
}
