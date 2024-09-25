//
//  ContentView.swift
//  aula6
//
//  Created by Turma01-10 on 25/09/24.
//

import SwiftUI
import Foundation
import MapKit

struct ContentView: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -9.39416, longitude: -40.5096),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    ))
    @State private var sheetOn = false
    
    var body: some View {
        ZStack {
            Map(position: $position)
                .ignoresSafeArea()
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer()
                    HStack {
                        ForEach(cidades) {cidade in
                            AsyncImage(url: URL(string: "\(cidade.flag)")!) { image in image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 80, alignment: .center)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    .padding(50)
                }
            }.ignoresSafeArea()
        }
    }
        }
        
struct Location: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let descricao: String
    
}
var cidades = [
    Location(name: "Petrolina", coordinate: CLLocationCoordinate2D(latitude: -9.39416, longitude: -40.5096), flag: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnwjhAHvoqjZnxAxOSIfRGjTihK4k9YkLVJg&s", descricao: "Petrolina se situa na margem norte do rio São Francisco, na divisa com o estado da Bahia. Faz conurbação com o município baiano de Juazeiro, integrando a Região Administrativa Integrada de Desenvolvimento do Polo Petrolina e Juazeiro, a maior RIDE do interior do Nordeste."),
    
    Location(name: "Juazeiro", coordinate: CLLocationCoordinate2D(latitude: -9.43014, longitude: -40.5037), flag: "https://upload.wikimedia.org/wikipedia/commons/4/4b/Bras%C3%A3o_de_Juazeiro.png", descricao: "Juazeiro é uma cidade baiana situada às margens do rio São Francisco. Conhecida pela produção de frutas, especialmente uvas, faz parte da RIDE com Petrolina."),
    
    Location(name: "Casa Nova", coordinate: CLLocationCoordinate2D(latitude: -8.44461, longitude: -40.6345), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Bandeira_de_Casa_Nova2.jpg/640px-Bandeira_de_Casa_Nova2.jpg", descricao: "Casa Nova é um município da Bahia, próximo ao rio São Francisco, destacando-se na agricultura irrigada e na produção de frutas."),
    
    Location(name: "Sobradinho", coordinate: CLLocationCoordinate2D(latitude: -9.02875, longitude: -40.3754), flag: "https://www.mbi.com.br/mbi/files/media/image/simbolopedia/municipio-sobradinho-bandeira-simb-brneba0200430774.jpg", descricao: "Sobradinho é um município baiano, famoso pela represa que forma o lago de Sobradinho, um dos maiores reservatórios do Brasil, e pela produção agrícola."),
    
    Location(name: "Lagoa Grande", coordinate: CLLocationCoordinate2D(latitude: -8.93834, longitude: -40.4438), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Lagoa_Grande-pe.png/1280px-Lagoa_Grande-pe.png", descricao: "Lagoa Grande é uma cidade pernambucana que se destaca pela fruticultura, especialmente a produção de uvas e melões."),
    
    Location(name: "Dormentes", coordinate: CLLocationCoordinate2D(latitude: -8.53631, longitude: -40.6974), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Dormentes-pe.png/800px-Dormentes-pe.png", descricao: "Dormentes é um município pernambucano, conhecido pela agricultura e pela proximidade com a região do Vale do São Francisco."),
    
    Location(name: "Afrânio", coordinate: CLLocationCoordinate2D(latitude: -8.57768, longitude: -40.6635), flag: "https://upload.wikimedia.org/wikipedia/commons/b/b2/BANDEIRA_AFR%C3%82NIO-PE.jpg", descricao: "Afrânio é um município de Pernambuco, famoso por sua produção agrícola, especialmente de frutas irrigadas, e pela cultura regional.")
]
         
#Preview {
    ContentView()
}
