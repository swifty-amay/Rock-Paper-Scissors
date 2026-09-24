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
            .tint(.teal)
            .font(.system(size: 20))
            .buttonStyle(.borderedProminent)
    }
}

struct ContentView: View {
    
    let items = ["🪨", "📰", "✂️"]
    @State private var appsMove = 0
    @State private var playerChoice = false
    @State private var score = 0
    
    var body: some View {
        
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 1, green: 0.8, blue: 0.1), location: 0.3),
                .init(color: Color(red: 0, green: 0.8, blue: 0.2), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack{
            
                Text("Rock, Paper & Scissor")
                    .font(.largeTitle.bold())
                Spacer()
                Text("How would you win if you have to")
                    .font(.title2)
                Text("\(playerChoice ? "Win" : "Lose")")
                    .font(.title.italic())
                Text("in order to win!!!")
                    .font(.title2)
                Text(items[appsMove])
                    .font(.system(size: 200))
                    .padding(.bottom)
                
                HStack(spacing: 40){
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
                Spacer()
                Text("Score: \(score)")
                    .font(.title.weight(.medium))
                    .padding(.bottom)
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .padding()
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
