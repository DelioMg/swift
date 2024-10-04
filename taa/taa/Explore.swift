//
//  Explore.swift
//  taa
//
//  Created by Turma01-10 on 02/10/24.
//

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
    @State private var currentTime: String = ""
    @State private var etimer: Timer?

    var body: some View {
            VStack  {
                HStack {
                    Text("**Robot Control**")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    HStack {
                        Button("Controle") { /* Controle manual */ }
                            .font(.title)
                            .buttonStyle(BorderlessButtonStyle())
                            .padding()
                            .foregroundColor(.white)
                        Button("Automático") { /* Controle automático */ }
                            .font(.title)
                            .buttonStyle(BorderlessButtonStyle())
                            .padding()
                            .foregroundColor(.white)
                        Button("Configurações") { /* Abrir configurações */ }
                            .font(.title)
                            .buttonStyle(BorderlessButtonStyle())
                            .foregroundColor(.white)
                            .padding()
                        Button("Sair") {}
                            .font(.title)
                            .buttonStyle(BorderlessButtonStyle())
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                    Text(currentTime)
                        .font(.largeTitle)
                }
                .padding()
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
                .padding()
                
                
                
                HStack{
   
                    VStack{
                        // Video Stream placeholder
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 800, height: 480)
                            .overlay(Text("Video Stream"))
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
                    
                    // Status display
                    HStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            Text("**Explore**")
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
                        HStack {
                            // Information about distance and speed
                            VStack(alignment: .leading) {
                                Text("Velocidade")
                                    .padding(1)
                                Text("\(evelocidade) m/s")
                                    .padding(1)
                                Text("Distância")
                                    .padding(1)
                                Text("\(edistancia) m")
                                    .padding(1)
                                Text("Tempo")
                                    .padding(1)
                                Text(currentTime)
                            }.padding()
                            
                            Divider()
                                .padding()
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
                        .frame(height: 180)  // Altura da divisória
                        .padding(.horizontal)
                    
                    HStack{
                        // Control buttons for sensors
                        VStack {
                            Button("LED") { /* Acionar LED */ }
                                .frame(width: 100, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .buttonStyle(BorderlessButtonStyle())
                            Button("Infravermelho") { /* Acionar Infravermelho */ }
                                .frame(width: 100, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .buttonStyle(BorderlessButtonStyle())
                            Button("Beep") { /* Acionar Beep */ }
                                .frame(width: 100, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    Divider()
                        .frame(height: 180)  // Altura da divisória
                        .padding(.horizontal)
                    // Directional controls
                    VStack {
                        Circle()
                            .strokeBorder(Color.gray, lineWidth: 2)
                            .frame(width: 180, height: 180)
                            .overlay(
                                
                                VStack {
                                    Button(action: { /* Direção para cima */ }) {
                                        Image(systemName: "chevron.up")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                    .padding()
                                    Spacer()
                                    HStack {
                                        Button(action: { /* Esquerda */ }) {
                                            Image(systemName: "chevron.left")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 20, height: 20)
                                        }.buttonStyle(BorderlessButtonStyle())
                                            .padding()
                                        Spacer()
                                        Button(action: { /* Direita */ }) {
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 20, height: 20)
                                        }.buttonStyle(BorderlessButtonStyle())
                                            .padding()
                                    }.padding()
                                    Spacer()
                                    Button(action: { /* Para baixo */ }) {
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                    .padding()
                                }
                            )
                    }
                    .padding(20)
                }
                Spacer()
            }
            .padding()
            Spacer()
    }
    
    private func startTimer() {
        etimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            currentTime = dateFormatter.string(from: Date())
        }
    }

    private func stopTimer() {
        etimer?.invalidate()
        etimer = nil
    }
        
}


#Preview {
   Explore()
}
