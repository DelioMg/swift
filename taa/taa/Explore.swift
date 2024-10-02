//
//  Explore.swift
//  taa
//
//  Created by Turma01-10 on 02/10/24.
//

import SwiftUI

import SwiftUI

struct Explore: View {
    @State private var robotBattery = 10.0
    @State private var orangePiBattery = 75.0
    @State private var maxSpeed = 300.0
    @State private var maxRotation = 200.0
    @State private var cameraResolution = "1280x720"
    @State private var distanceToObstacle = 100
    @State private var distanceToObstacle2 = 80
    @State private var distanceToObstacle3 = 20
    @State private var evelocidade = 100
    @State private var edistancia = 100
    @State private var etimer: Timer? = nil

    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Robot Control")
                    .font(.title)
                Spacer()
                HStack {
                    Button("Controle") { /* Controle manual */ }
                    Button("Automático") { /* Controle automático */ }
                    Button("Configurações") { /* Abrir configurações */ }
                    Button("Sair") { /* Sair do app */ }
                }
                Spacer()
                Text("11:43 AM")
                    .font(.title3)
            }
            .padding()
            
            
            
            HStack{
                // Video Stream placeholder
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 1000, height: 480)
                    .overlay(Text("Video Stream"))

                // Status display
                HStack(spacing: 30) {
                    VStack(alignment: .leading) {
                        Text("iRobot Create 2")
                            .font(.largeTitle)
                        Divider()
                        Text("Bateria Robot")
                        HStack {
                            ProgressView(value: robotBattery, total: 100)
                                .progressViewStyle(LinearProgressViewStyle(tint: robotBattery <= 20 ? .red : .green))
                                .frame(width: 300)
                            Text("\(Int(robotBattery))%")
                        }
                        .padding()
                        Text("Bateria OrangePi")
                        HStack {
                            
                            ProgressView(value: orangePiBattery, total: 100)
                                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                                .frame(width: 300)
                            Text("\(Int(orangePiBattery))%")
                        }
                        .padding()
                        Divider()
                        // Speed and rotation sliders
                            .padding()
                        Text("Velocidade Maxima")
                        HStack {
                            Slider(value: $maxSpeed, in: 0...500)
                            Text("\(Int(maxSpeed)) mm/s")
                        }
                        .padding()
                        Text("Rotação Maxima")
                        HStack {
                            Slider(value: $maxRotation, in: 0...500)
                            Text("\(Int(maxRotation)) mm/s")
                        }
                    }
                }
            }
            HStack{
            VStack{
                VStack{
                    // Distance to obstacle display
                    Text("Distância ao obstáculo:")
                    HStack {
                        VStack {
                            ProgressView(value: Double(distanceToObstacle), total: 100)
                                .progressViewStyle(LinearProgressViewStyle(tint: distanceToObstacle <= 20 ? .red : .green))
                                .frame(width: 150)
                            Text("\(distanceToObstacle) cm")
                        }
                        
                        VStack {
                            ProgressView(value: Double(distanceToObstacle2), total: 100)
                                .progressViewStyle(LinearProgressViewStyle(tint: distanceToObstacle2 <= 20 ? .red : .green))
                                .frame(width: 150)
                            Text("\(distanceToObstacle2) cm")
                        }
                        VStack {
                            ProgressView(value: Double(distanceToObstacle3), total: 100)
                                .progressViewStyle(LinearProgressViewStyle(tint: distanceToObstacle3 <= 20 ? .red : .green))
                                .frame(width: 150)
                            Text("\(distanceToObstacle3) cm")
                        }
                    }
                }
            HStack {
                // Information about distance and speed
                VStack(alignment: .leading) {
                    Text("Velocidade")
                    Text("\(evelocidade) m/s")
                    Text("Distância")
                    Text("\(edistancia) m")
                    Text("Tempo")
                    Text("\(etimer)")
                }
                Spacer()
                Divider()
                    .frame(height: 100)  // Altura da divisória
                    .padding(.horizontal)
                // Camera resolution options
                VStack(alignment: .leading) {
                    //Text("Resolução da Câmera")
                    Picker(selection: $cameraResolution, label: Text("Resolução")) {
                        Text("1920x1080").tag("1920x1080")
                        Text("1600x900").tag("1600x900")
                        Text("1280x720").tag("1280x720")
                        Text("800x600").tag("800x600")
                        Text("640x480").tag("640x480")
                    }
                    .pickerStyle(.inline)
                }
            }
        }
                Spacer()
                
                Divider()
                    .frame(height: 200)  // Altura da divisória
                    .padding(.horizontal)
                
                HStack{
                    // Control buttons for sensors
                    VStack {
                        Button("LED") { /* Acionar LED */ }
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Button("Infravermelho") { /* Acionar Infravermelho */ }
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Button("Beep") { /* Acionar Beep */ }
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                Divider()
                    .frame(height: 100)  // Altura da divisória
                    .padding(.horizontal)
                // Directional controls
                VStack {
                    Circle()
                        .strokeBorder(Color.gray, lineWidth: 2)
                        .frame(width: 100, height: 100)
                        .overlay(
                            VStack {
                                Button(action: { /* Direção para cima */ }) {
                                    Image(systemName: "arrow.up")
                                }
                                HStack {
                                    Button(action: { /* Esquerda */ }) {
                                        Image(systemName: "arrow.left")
                                    }
                                    Button(action: { /* Direita */ }) {
                                        Image(systemName: "arrow.right")
                                    }
                                }
                                Button(action: { /* Para baixo */ }) {
                                    Image(systemName: "arrow.down")
                                }
                            }
                        )
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
   Explore()
}
