//
//  ContentView.swift
//  aula2
//
//  Created by Turma01-10 on 19/09/24.
//

import SwiftUI

struct backgrond: View {
    var body: some View {
        Image("lado")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .overlay(Color.white.opacity(0.8))
    }
}

struct title : View {
    var nome: String

    var body: some View {
    Text("Bem vindo," + nome)
            .font(.largeTitle)
            .frame(alignment:.top)
    }
}
struct imagens : View {
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 250 , height: 150)
                .scaledToFit()
            Image("truck")
                .resizable()
                .frame(width: 250 , height: 120)
                .scaledToFit()
        }
    }
}


struct ContentView: View {
    @State var name:String = ""
    @State private var showAlert = false
    var body: some View {
        ZStack{
            backgrond()
            VStack{
                title(nome:name)
                TextField("Nome ", text: $name)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                Spacer()
                imagens()
                Spacer()
                Button(action: {
                    showAlert = true
                }){
                    Text("Entrar")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding()
                        .cornerRadius(10)
                }

                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Alerta!"),
                        message: Text("Você irá iniciar o desafio da aula agora, vamos lá."),
                        dismissButton: .default(Text("Vamos lá"))
                    )
                }

       

            }.frame(alignment:.top)
            
            
        }
        
    }
}

#Preview {
    ContentView()
  
    
}
