//
//  ContentView.swift
//  aula3
//
//  Created by Turma01-10 on 20/09/24.
//

import SwiftUI

struct Botao: View {
    @Binding var pesos: String
    @Binding var alturas: String
    @Binding var imc: Double
    @Binding var resultado: String
    @Binding var cor: Color

    var body: some View {
        Button("Calcular") {
            if let peso = Double(pesos), let altura = Double(alturas), peso > 0, altura > 0 {
                imc = peso / (altura * altura)
                // Determinar o resultado com base no IMC calculado
                if imc < 18.5 {
                    resultado = "Abaixo do peso"
                    cor = .baixo
                } else if imc >= 18.5 && imc <= 24.9 {
                    resultado = "Peso normal"
                    cor = .normal
                } else if imc >= 25.0 && imc <= 29.9 {
                    resultado = "Sobrepeso"
                    cor = .sobre
                } else {
                    resultado = "Obesidade"
                    cor = .obeso
                }
            } else {
                print("Por favor, insira valores válidos para peso e altura.")
            }
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ContentView: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var imc: Double = 0
    @State private var resultado: String = ""
    @State private var cor: Color = .green

    var body: some View {
        ZStack {
            // Alterar a cor de fundo com base no resultado
            Rectangle()
                .fill(cor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .padding(.vertical, 10)
                TextField("Peso", text: $peso)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(.vertical, 10)
                    .keyboardType(.decimalPad) // Para facilitar a entrada de números
                TextField("Altura", text: $altura)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(.vertical, 2)
                    .keyboardType(.decimalPad) // Para facilitar a entrada de números
                Botao(pesos: $peso, alturas: $altura, imc: $imc, resultado: $resultado, cor: $cor)

 
                Text(resultado)
                    .font(.largeTitle)
                    .padding(.vertical, 120)
                    .foregroundColor(.white)
                    .padding(.vertical, 40)
                Image("tabela")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}


#Preview {
    ContentView()
}
