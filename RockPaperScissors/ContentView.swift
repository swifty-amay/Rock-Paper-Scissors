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
    @State private var answerIsCorrect = false
    @State private var showTitle = ""
    @State private var numberOfQuestions = 0
    @State private var showFinalAlert = false
    
    var body: some View {
        
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 1, green: 0.7, blue: 0.1), location: 0.3),
                .init(color: Color(red: 0, green: 0, blue: 0.4), location: 0.3),
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
        .alert(showTitle, isPresented: $answerIsCorrect){
            Button("Continue", action: askAgain)
        } message: {
            Text("Your score is: \(score)")
        }
        .alert("Wow! You made it...", isPresented: $showFinalAlert){
            Button("Ok"){ }
            Button("Restart", action: restart)
        } message: {
            Text("Congratulations! You have successfully completed the game. Your final score is \(score)")
        }
    
    }
    
    func askAgain(){
        appsMove = Int.random(in: 0..<3)
        playerChoice = Bool.random()
    }
    func restart(){
        appsMove = Int.random(in: 0..<3)
        playerChoice = Bool.random()
        score = 0
        numberOfQuestions = 0
    }
    
    func checkAnswer(for appMove: String, value playerChoice: Bool, with playerMove: String){
        if(numberOfQuestions == 9){
            showFinalAlert = true
        }
        switch appMove{
        case "🪨":
            if(playerChoice && playerMove == "paper"){
                score += 1
                showTitle = "Correct ✅"
            } else if(!playerChoice && playerMove == "scissor"){
                score += 1
                showTitle = "Correct ✅"
            } else{
                score -= 1
                showTitle = "Wrong ❌"
            }
        case "✂️":
            if(playerChoice && playerMove == "rock"){
                score += 1
                showTitle = "Correct ✅"
            } else if(!playerChoice && playerMove == "paper"){
                score += 1
                showTitle = "Correct ✅"
            } else{
                score -= 1
                showTitle = "Wrong ❌"
            }
        case "📰":
            if(playerChoice && playerMove == "scissor"){
                score += 1
                showTitle = "Correct ✅"
            } else if(!playerChoice && playerMove == "rock"){
                score += 1
                showTitle = "Correct ✅"
            } else{
                score -= 1
                showTitle = "Wrong ❌"
            }
        default:
            score = 0
        }
        answerIsCorrect = true
        numberOfQuestions += 1
    }
}

#Preview {
    ContentView()
}
