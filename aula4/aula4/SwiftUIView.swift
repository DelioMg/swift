//
//  SwiftUIView.swift
//  aula4
//
//  Created by Turma01-10 on 23/09/24.
//

import SwiftUI

struct back: View {
    var body: some View {
        Rectangle()
            .fill(.fundo)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SwiftUIView: View {
    @State private var showingSheet = false
    
    var body: some View {
        
        NavigationStack {
        ZStack{
            back()
            VStack{
                Image("logo")
                                .resizable()
                                .scaledToFit()
                                VStack(spacing: 20) {
                                    NavigationLink(destination: modo1()) {
                                        Text("Modo 1")
                                            .font(.title)
                                            .padding(.horizontal, 60)
                                            .padding(.vertical, 30)
                                            .background(.pink)
                                            .foregroundStyle(.white)
                                            .cornerRadius(5)
                                    }
                                    NavigationLink(destination: modo2()) {
                                        Text("Modo 2")
                                            .font(.title)
                                            .padding(.horizontal, 60)
                                            .padding(.vertical, 30)
                                            .background(.pink)
                                            .foregroundStyle(.white)
                                            .cornerRadius(5)
                                    }
                                    Button("Modo 3") {
                                                showingSheet.toggle()
                                            }
                                    .font(.title)
                                    .padding(.horizontal, 60)
                                    .padding(.vertical, 30)
                                    .background(.pink)
                                    .foregroundStyle(.white)
                                    .cornerRadius(5)
                                            .sheet(isPresented: $showingSheet) {
                                                SheetView()
                                            }
                                    }
                                }
            }
            
                
            
        }
                    
                     }
        
     }
 

 struct modo1: View {
     var body: some View {
         ZStack{
             back()
             Rectangle()
                 .fill(.pink)
                 .frame(width:300, height: 180)
                 .cornerRadius(10)
                  Text("Nome: Thiago \n Sobrenome:Pereira")
                 .multilineTextAlignment(.center)
                 .font(.largeTitle)
                 .foregroundColor(.white)
              
         }
     }
 }

struct modo2: View {
    @State private var name: String = ""

        var body: some View {
            ZStack{
                back()
                Rectangle()
                    .fill(.pink)
                    .frame(width:300, height: 250)
                    .cornerRadius(10)
                    
                VStack(alignment: .center) {
                                TextField("Enter your name", text: $name)
                                    .multilineTextAlignment(.center)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                Text("Bem Vindo, \(name)!")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                NavigationStack{
                                    NavigationLink(destination:modo22(nome: name)){
                                        Text("Acessar  tela")
                                            .font(.title2)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 10)
                                            .background(.blue)
                                            .foregroundStyle(.white)
                                            .cornerRadius(5)
                                    }
                                }
                            }
            }
            
        }
}

struct modo22: View {
    var nome: String
    var body: some View {
            ZStack{
                back()
                Rectangle()
                    .fill(.pink)
                    .frame(width:150, height: 150)
                    .cornerRadius(10)
                     Text("Volte, \n \(nome)!")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                 
            }
            .navigationBarTitle("Modo 1", displayMode: .inline)
            
    }
}

struct SheetView: View {
    

    var body: some View {
        ZStack{
            back()
            Rectangle()
                .fill(.pink)
                .frame(width:300, height: 180)
                .cornerRadius(10)
                 Text("Nome: Thiago \n Sobrenome:Pereira")
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .foregroundColor(.white)
             
        }
 
    }
}

#Preview {
    SwiftUIView()
}
