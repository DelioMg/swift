//
//  d2.swift
//  aula1
//
//  Created by Turma01-10 on 18/09/24.
//

import SwiftUI

struct d2: View {
    var body: some View {
        HStack{
            Image("truck")
                .resizable().scaledToFit().clipShape(Circle())
        VStack{
                
                Text("HackaTruck")
                    .foregroundStyle(.red)
                Text("77 Universidade")
                    .foregroundStyle(.blue)
                Text("5 regiões do Brasil")
                    .foregroundStyle(.yellow)
            }
            
            Spacer()
        }
    }
}

#Preview {
    d2()
}
