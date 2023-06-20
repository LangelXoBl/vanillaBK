//
//  ApiBK.swift
//  vanillaBK
//
//  Created by imac_01 on 19/06/23.
//

import Foundation

struct UserReq: Codable {
    var name: String
    var lastname:String
    var email: String
    var rfc: String
    var phone:String
    var password: String
    var id_bank:Int
}

struct UserResp: Codable {
    var status: String
    var data: DataRes
    
}

struct DataRes: Codable{
    var name: String
    var lastname:String
    var email: String
    var rfc: String
    var phone:String
    var password: String
    var id_bank:Int
    var id: Int
}

class APIBK: ObservableObject{
    @Published var movements = [movement]()
    
    let url_base = "http://172.16.129.215:3000/users"
    
    func register( request: UserReq) async throws -> UserResp?{
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
            print(response)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 201 else {
                print("Error en la peticion")
                return nil
            }
            
            let loginResponse = try JSONDecoder().decode(UserResp.self, from: data)
            print(loginResponse)
            return loginResponse
        }
    
    // Con @scaping ignora los errores
    // se le pasa el callback que retornara el response
    func fetchMovements(completion: @escaping([movement])->( ) ){
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
                            [movement].self, from: data
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
}
