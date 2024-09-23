//
//  ContentView.swift
//  aula4
//
//  Created by Turma01-10 on 23/09/24.
//

import SwiftUI

struct RosaView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.pink)
                .edgesIgnoringSafeArea(.top)
            Circle()
                .frame(width: 350, height: 350, alignment: .topLeading)
               
            Image(systemName: "paintbrush")
                .resizable()
                .foregroundStyle(.pink)
                .frame(width: 250, height: 250, alignment: .topLeading)
   
        }
        

    }
}

struct AzulView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
                .edgesIgnoringSafeArea(.top)
            Circle()
                .frame(width: 350, height: 350, alignment: .topLeading)
               
            Image(systemName: "paintbrush.pointed")
                .resizable()
                .foregroundStyle(.blue)
                .frame(width: 250, height: 250, alignment: .topLeading)
   
        }
        

    }
}

struct CinzaView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.gray)
                .edgesIgnoringSafeArea(.top)
            Circle()
                .frame(width: 350, height: 350, alignment: .topLeading)
               
            Image(systemName: "paintpalette")
                .resizable()
                .foregroundStyle(.gray)
                .frame(width: 230, height: 200, alignment: .topLeading)
   
        }
        

    }
}

struct ListaView: View {
    var body: some View {
        NavigationStack {
            List {
                HStack{
                    Text("Item")
                        Spacer()
                    Image(systemName: "paintbrush")
                }
                
                HStack{
                    Text("Item")
                        Spacer()
                    Image(systemName: "paintbrush.pointed")
                }
                HStack{
                    Text("Item")
                        Spacer()
                    Image(systemName: "paintpalette")
                }
            }
            .navigationTitle("List")
        }
    }
}

struct ContentView: View {
    var body: some View {
            TabView{
                        RosaView()
                            .tabItem{
                                Label("Rosa", systemImage:"paintbrush.fill")
                            }
                        AzulView()
                            .tabItem{
                                Label("Azul", systemImage:"paintbrush.pointed.fill")
                            }
                        CinzaView()
                            .tabItem{
                                Label("Cinza", systemImage:"paintpalette.fill")
                            }
                        ListaView()
                            .tabItem{
                                Label("Lista", systemImage:"list.bullet")
                            }

                    }
        
        
    }
}

#Preview {
    ContentView()
}
