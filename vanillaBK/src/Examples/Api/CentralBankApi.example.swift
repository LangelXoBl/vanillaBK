//
//  CentralBankApi.example.swift
//  vanillaBK
//
//  Created by imac_01 on 12/06/23.
//

import Foundation

class CentralBankAPIExample: ObservableObject{
    @Published var movements = [MovementExample]()
    
    let url_base = "http://172.16.105.17:3000/movements"
    
    // Con @scaping ignora los errores
    // se le pasa el callback que retornara el response
    func fetchMovements(completion: @escaping([MovementExample])->( ) ){
        // similar a un tryCatch, se usa para validar el url (validaciones simples)
        guard let url = URL(string: url_base)
        else {
            print("URL no valido")
            return
        }
        // se prepara el request
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) {
            // devuelve estos datos
            data, response, error in
            //revisa si ocurrio un error en la peticion
            if let error = error {
                print("Ocurrio un error", error.localizedDescription)
                return
            }
            // revisa que la respuesta sea de tipo HTTPURLresponse
            guard let response = response as? HTTPURLResponse
            else {
                return
            }
            
            if response.statusCode == 200 {
                // revisa si data tiene contenido
                guard let data = data else {
                    return
                }
                
                DispatchQueue.main.async {
                    do {
                        let movements = try JSONDecoder().decode(
                            [MovementExample].self, from: data
                        )
                        // aqui se manda el responde
                        completion(movements)
                    }catch{
                        print("Error in dispatch")
                    }
                }
            }
        }.resume() // se usa para decirle a quien lo consuma que se completo la tarea
    }
    
    
    func login( request: LoginReqExample) async throws -> LoginReqExample?{
            //var result : LoginRes?
            
            guard let url = URL(string: url_base) else{
                print("URL no valido")
                return nil
            }
            
            var urlReq = URLRequest(url: url)
            urlReq.httpMethod = "POST"
            urlReq.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let encoder = JSONEncoder()
            
            do {
                urlReq.httpBody = try encoder.encode(request)
            } catch {
                print("Fallo al conectar")
                return nil
            }
            
            let (data, response) = try await URLSession.shared.data(for: urlReq)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 201 else {
                return nil
            }
            
            let loginResponse = try JSONDecoder().decode(LoginReqExample.self, from: data)
            
            return loginResponse
        }
    
}
