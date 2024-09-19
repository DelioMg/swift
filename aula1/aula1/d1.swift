//
//  ContentView.swift
//  aula1
//
//  Created by Turma01-10 on 18/09/24.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        HStack{VStack {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
            Spacer()
            Rectangle()
                .fill(.green)
                .frame(width: 100, height: 100)
            
        }
            Spacer()
            VStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                Spacer()
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 100, height: 100)
                    
            }}
        
        .padding()
    }
}

#Preview {
    ContentView()
}
