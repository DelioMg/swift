//
//  ContentView.swift
//  taa
//
//  Created by Turma01-10 on 26/09/24.
//

import SwiftUI

struct RobotControlApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 400, minHeight: 300)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("Robot Control")
                    .font(.largeTitle)
                    .padding()
                
                Text("Selecione o robô para se conectar:")
                    .font(.headline)
                
                VStack {
                    NavigationLink(destination: Irobot()) {
                        Text("Irobot")
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: Explore()) {
                        Text("Explore")
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: Drone()) {
                        Text("Drone")
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: Outros()) {
                        Text("Outros")
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.leading)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
