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


import SwiftUI

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State private var alertType: AlertType? = nil

    enum AlertType: Identifiable {
        case first
        case second
        
        var id: Int {
            switch self {
            case .first: return 1
            case .second: return 2
            }
        }
    }

    var body: some View {
        ZStack {
            backgrond()
            VStack {
                title(nome: name)
                TextField("Nome", text: $name)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                Spacer()
                imagens()
                Spacer()
                Button(action: {
                    alertType = .first
                }) {
                    Text("Entrar")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding()
                        .cornerRadius(10)
                }
            }
            .alert(item: $alertType) { type in
                switch type {
                case .first:
                    return Alert(
                        title: Text("Alerta!"),
                        message: Text("Você irá iniciar o desafio da aula agora, vamos lá."),
                        dismissButton: .default(Text("Vamos lá")) {
                            alertType = .second
                        }
                    )
                case .second:
                    return Alert(
                        title: Text("Desafio finalizado!"),
                        message: Text("Muito bem"),
                        dismissButton: .default(Text("OK")) {
                            // Ação após o segundo alerta, se necessário
                        }
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
  
    
}
