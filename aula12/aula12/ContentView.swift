import SwiftUI

struct SeuModelo: Identifiable, Codable {
    var id: String { _id }
    var _id: String
    var umidade: String
    var dataHora: String
}

struct ContentView: View {
    @State private var dados: [SeuModelo] = []
    @State private var timer: Timer?
    @State private var Fundo: Color = .white
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Fundo)
        VStack {
            if let ultimoDado = dados.sorted(by: { $0.dataHora > $1.dataHora }).first {
                
                let corFundo = corParaUmidade(umidade: Double(ultimoDado.umidade) ?? 0.0)
                
                VStack(alignment: .center) {
                    Text("Umidade:" )
                        .font(.largeTitle)
                    Text("\(ultimoDado.umidade)%")
                        .font(.largeTitle)
                    
                }
                .padding()
                .background(corFundo)
                .cornerRadius(10)
            } else {
                Text("Nenhum dado disponível")
            }
        }
        .padding()
        .onAppear {
            fetchData() // Chama fetchData ao aparecer
            startTimer() // Inicia o timer
        }
        .onDisappear {
            timer?.invalidate() // Para o timer quando a view desaparecer
        }
    }
}
    // Função para determinar a cor de fundo com base na umidade
    func corParaUmidade(umidade: Double) -> Color {
        switch umidade {
        case 0..<30:
            return Color.blue // Baixa umidade
        case 30..<60:
            return Color.green // Umidade média
        case 60..<90:
            return Color.yellow // Umidade alta
        default:
            return Color.red // Umidade muito alta
        }
    }
    
    // Função para buscar os dados
    func fetchData() {
        guard let url = URL(string: "http://10.87.155.50:1880/leituraGET") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro de requisição: \(error)")
                return
            }
            
            guard let data = data else {
                print("Dados nulos")
                return
            }
            
        
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Resposta da API: \(jsonString)")
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode([SeuModelo].self, from: data)
                DispatchQueue.main.async {
                    self.dados = responseData
                    print("Dados recebidos: \(self.dados)")
                }
            } catch {
                print("Erro ao decodificar os dados: \(error)")
            }
        }.resume()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}


#Preview {
    ContentView()
}
