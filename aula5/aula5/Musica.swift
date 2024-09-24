//
//  Musica.swift
//  aula5
//
//  Created by Turma01-10 on 24/09/24.
//

import SwiftUI

struct mus: View {
    var name : String = "teste"
    var artista : String = "artista"
    var capa : String = "https://www.ufca.edu.br/portal/wp-content/uploads/2024/05/IBM.png"
    var body: some View {
        ZStack{
            back()
            VStack {
                Spacer()
                AsyncImage(url: URL(string: "\(capa)")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, alignment: .center)
                } placeholder: {
                    ProgressView()
                }
                Text("\(name)")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title3)
                    .foregroundStyle(.white)
                Text("\(artista)")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    Spacer()
                HStack{
                    Image(systemName: "shuffle")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                    Image(systemName: "play.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                    Image(systemName: "repeat")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                }.padding(.vertical, 10)
                Spacer()
            }
        }
    }
}

#Preview {
    mus()
}
