//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Amay Raj Srivastav on 24/09/26.
//

import SwiftUI

struct ButtonView: View {
    let name: String
    var body: some View {
        Text(name)
    }
}



struct ContentView: View {
    
    let items = ["🪨", "📰", "✂️"]
    @State private var appsMove = 0
    @State private var playerChoice = false
    
    var body: some View {
        VStack{
            Text("Score: ???")
                .font(.largeTitle.bold())
            Text("It's a: \(playerChoice ? "Win" : "Lose")")
                .font(.title)
            Text(items[appsMove])
                .font(.system(size: 200))
            HStack(spacing: 48){
                ButtonView(name: "Rock")
                ButtonView(name: "Paper")
                ButtonView(name: "Scissor")
            }
        }
    }
}

#Preview {
    ContentView()
}
