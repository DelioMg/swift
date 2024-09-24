//
//  ContentView.swift
//  aula5
//
//  Created by Turma01-10 on 23/09/24.
//

import SwiftUI

struct Song: Identifiable{
    var id : Int
    var nome : String
    var artista: String
    var capa : String
    
}


var arrayMusicas = [
    Song(id: 1, nome: "Coração Machucado", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 2, nome: "O Mundo é um Moinho", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 3, nome: "Sofrendo em Silêncio", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 4, nome: "Dançar de Pé", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 5, nome: "Tô Com Moral no Céu", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 6, nome: "Quando a Gente Ama", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 7, nome: "Te Amo de Verdade", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 8, nome: "A Lenda", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 9, nome: "Coração de Pedra", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b"),
    Song(id: 10, nome: "Faz Amor Comigo Só Hoje", artista: "Dorgival Dantas", capa: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b")
]



struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                back()
                    
                ScrollView {
                    VStack {
                        Spacer()
                        
                        AsyncImage(url: URL(string: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b")!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 250, alignment: .center)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding()
                        Text("Simplesmente")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        HStack{
                            AsyncImage(url: URL(string: "https://i.scdn.co/image/ab67616d0000b273fd3abf808a406ace931ceb8b")!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 40, alignment: .center)
                            } placeholder: {
                                ProgressView()
                            }
                            Text("Dorgival Dantas")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        ForEach(arrayMusicas) { musica in
                            HStack{
                                AsyncImage(url: URL(string: "\(musica.capa)")!) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60, alignment: .center)
                                } placeholder: {
                                    ProgressView()
                                }
                                NavigationLink(destination: mus(name: musica.nome, artista: musica.artista,capa: musica.capa)){
                                    VStack{
                                        /*@START_MENU_TOKEN@*/Text(musica.nome)/*@END_MENU_TOKEN@*/
                                            .padding(10)
                                            .foregroundColor(.white)
                                    }
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .imageScale(.large)
                                    .foregroundStyle(.white)
                            }
                            
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(1..<10) {
                                Text(" \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 200)
                                    .background(.gray)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        }
}

struct back: View{
    var body: some View{
        ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.clear]), startPoint: .top, endPoint: .bottom)
                .frame(height: 380)
                .edgesIgnoringSafeArea(.all)
        }
    }
}



#Preview {
    ContentView()
}
