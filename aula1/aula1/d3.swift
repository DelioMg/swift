//
//  SwiftUIView.swift
//  aula1
//
//  Created by Turma01-10 on 18/09/24.
//

import SwiftUI

struct Imagens: View {
    var body: some View {
        HStack{
            Image("truck")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            Image("lado")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
        }
        HStack{
            Image("truck2")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            Image("logo2")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            Image("truck3")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
        }
        HStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 130, height: 130)
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 130, height: 130)
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 130, height: 130)
        }
    }
}

struct botoes : View {
    var body: some View {

        Spacer().scaledToFit()
        Image(systemName: "circle.grid.3x3.fill")
        Spacer().scaledToFit()
        Image(systemName: "rectangle.fill")
            .opacity(0.4)
        Spacer().scaledToFit()
        Image(systemName: "person.crop.square.fill")
            .opacity(0.4)
        Spacer().scaledToFit()

    }
}

struct SwiftUIView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Hackatruck")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                
                Image(systemName: "goforward")
                    .opacity(0.4)
                Image(systemName: "rectangle.grid.1x2.fill")
                    .opacity(0.4)
                    
            }

            HStack{
                Spacer()
                Image("lado")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    Spacer()
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Text("8")
                                .bold()
                            Text("Posts")
                            
                        }
                        VStack{
                            Text("12k")
                                .bold()
                            Text("Seguidores")
                        }
                        VStack{
                            Text("8k")
                                .bold()
                            Text("Seguindo")
                        }
                        Spacer()
                    }
                    
                    VStack {
                        Button("Editar Perfil") {
                            
                        }
                        .padding(.horizontal, 60)
                        .controlSize(.small)
                        .background(.gray.opacity(0.3))
                        .foregroundColor(.black)
                        .font(.title2)

                    }
                    .font(.title)
                }
            }
            Text("HackaTruck MakerSpace")
                .frame(maxWidth: .infinity, alignment: .leading)
                
            Text("Capacitação Swift")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 3)
            Divider()
                
            HStack{

            botoes()
            }
            .padding(.vertical, 8)
            Divider()
            
            Imagens()
            
        }
    }
}


#Preview {
    SwiftUIView()

}
