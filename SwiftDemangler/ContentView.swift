//
//  ContentView.swift
//  SwiftDemangler
//
//  Created by Robert Galli on 2/1/24.
//

import SwiftUI
import SwiftDemangle

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var displayText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter mangled Swift", text: $inputText)
                .padding()
                .font(.system(size: 18))
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            
            Button(action: {
                withAnimation {
                    self.displayText = self.inputText.demangled
                }
            }) {
                Text("Demangle")
                    .foregroundColor(.gray)
                    .padding()
            }
            .cornerRadius(10)
            .font(.system(size: 18, weight: .medium, design: .default))
            .shadow(radius: 5)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .shadow(radius: 5)
                
                TextEditor(text: $displayText)
                    .font(.title)
                    .padding()
                    .background(Color.clear)
                    .frame(minHeight: 100)
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
