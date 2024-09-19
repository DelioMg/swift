//
//  SwiftUIView.swift
//  aula1
//
//  Created by Turma01-10 on 18/09/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Hackatruck")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "goforward")
                Image(systemName: "rectangle.grid.1x2.fill")
                    
            }

            HStack{
                Image("truck")
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
                            Text("Fotos")
                            
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
                        .padding()
                        .background(.gray.opacity(0.3))
                        .foregroundColor(.black)
                        .font(.title2)

                    }
                    .font(.title)
                }
            }
            Text("HackaTruck")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            Text("HackaTruck")
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Spacer().scaledToFit()
                Image(systemName: "circle.grid.3x3.fill")
                Spacer().scaledToFit()
                Image(systemName: "rectangle.fill")
                Spacer().scaledToFit()
                Image(systemName: "person.crop.square.fill")
                Spacer().scaledToFit()

            }
            VStack{
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
    }
}


#Preview {
    SwiftUIView()

}
