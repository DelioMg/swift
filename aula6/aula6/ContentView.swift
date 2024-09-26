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
    @State private var position = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -9.39416, longitude: -40.5096),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
    
    @State private var selectedCity: Location?
    @State private var currenCity = "Petrolina"
    @State private var sheetOn = false

    var body: some View {
        ZStack {
            Map(coordinateRegion: $position, annotationItems: cidades){ cidade in
                MapAnnotation(coordinate: cidade.coordinate){
                    Button{
                        selectedCity = cidade
                        sheetOn = true
                    }label: {
                        Image(systemName: "flag.circle.fill")
                    }
                }

              }
            }
            
        .sheet(isPresented: $sheetOn){
            SheetView()
         }
            
        .ignoresSafeArea()
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer()
                    HStack {
                        ForEach(cidades) { cidade in
                            AsyncImage(url: URL(string: cidade.flag)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 80, alignment: .center)
                                    .onTapGesture {
                                        self.selectedCity = cidade
                                    }
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


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let descricao: String
}

var cidades = [
    Location(name: "Petrolina", coordinate: CLLocationCoordinate2D(latitude: -9.39416, longitude: -40.5096), flag: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnwjhAHvoqjZnxAxOSIfRGjTihK4k9YkLVJg&s", descricao: "Petrolina se situa na margem norte do rio São Francisco."),
    Location(name: "Juazeiro", coordinate: CLLocationCoordinate2D(latitude: -9.174963859352093, longitude:-40.9750424338918), flag: "https://upload.wikimedia.org/wikipedia/commons/4/4b/Bras%C3%A3o_de_Juazeiro.png", descricao: "Juazeiro é uma cidade baiana situada às margens do rio São Francisco."),
    Location(name: "Casa Nova", coordinate: CLLocationCoordinate2D(latitude: -8.44461, longitude: -40.6345), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Bandeira_de_Casa_Nova2.jpg/640px-Bandeira_de_Casa_Nova2.jpg", descricao: "Casa Nova é um município da Bahia."),
    Location(name: "Sobradinho", coordinate: CLLocationCoordinate2D(latitude: -9.02875, longitude: -40.3754), flag: "https://www.mbi.com.br/mbi/files/media/image/simbolopedia/municipio-sobradinho-bandeira-simb-brneba0200430774.jpg", descricao: "Sobradinho é um município baiano, famoso pela represa."),
    Location(name: "Lagoa Grande", coordinate: CLLocationCoordinate2D(latitude: -8.93834, longitude: -40.4438), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Lagoa_Grande-pe.png/1280px-Lagoa_Grande-pe.png", descricao: "Lagoa Grande é uma cidade pernambucana."),
    Location(name: "Dormentes", coordinate: CLLocationCoordinate2D(latitude: -8.53631, longitude: -40.6974), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Dormentes-pe.png/800px-Dormentes-pe.png", descricao: "Dormentes é um município pernambucano."),
    Location(name: "Afrânio", coordinate: CLLocationCoordinate2D(latitude: -8.57768, longitude: -40.6635), flag: "https://upload.wikimedia.org/wikipedia/commons/b/b2/BANDEIRA_AFR%C3%82NIO-PE.jpg", descricao: "Afrânio é um município de Pernambuco.")
]

struct CityDetailView: View {
    var city: Location

    var body: some View {
        VStack {
            Text(city.name)
                .font(.largeTitle)
            AsyncImage(url: URL(string: city.flag)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            } placeholder: {
                ProgressView()
            }
            Text(city.descricao)
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct SheetView: View {
    var body: some View {
        VStack {
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b2/BANDEIRA_AFR%C3%82NIO-PE.jpg")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                } placeholder: {
                    ProgressView()
                }.padding()
                Text("Petrolina")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                Text("Afrânio é um município de Pernambuco.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.black)
            }
        Spacer()
        }
    
}

#Preview {
    ContentView()
}
