//
//  ContentView.swift
//  TimeKiller
//
//  Created by Никита Рыжкин on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Double = 10
    @State private var targetValue: Int = 50
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderView(value: $currentValue, alpha: Double(computeScore()))
                Text("100")
            }
            Button(action: getAlert) {
                Text("Проверь меня!")
            }
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(computeScore())")
            }
            Button(action: getRandomeValue) {
                Text("Начать заново")
            }
        }
        .padding()
    }
    
    private func getRandomeValue() {
        targetValue = Int.random(in: 0...100)
    }
    
    private func getAlert() {
        showAlert.toggle()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
