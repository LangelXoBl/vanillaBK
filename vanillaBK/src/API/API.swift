//
//  API.swift
//  vanillaBK
//
//  Created by IMac_01_Invitado on 06/07/23.
//

import Foundation

enum methodsHTTP {
case GET, POST, PATCH, DELETE
    
    var toString : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .GET: return "GET"
        case .POST: return "POST"
        case .PATCH: return "PATCH"
        case .DELETE: return "DELETE"
        }
      }
}

class CentralBankAPI2: ObservableObject{
    @Published var movements = [movement]()
    let token = UserDefaults.standard.string(forKey: "token") ?? "NA"
    
    let url_base = "https://8666-187-188-58-190.ngrok-free.app"
    
    func connectApi<T: Encodable >(path: String, method:methodsHTTP , body: T)async throws -> (Data, URLResponse)? {
        // se valida el url
        guard let url = URL(string: url_base + path)
        else {
            print("Error en url")
            return nil
        }
        // se prepara la peticion
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.toString
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let encoder = JSONEncoder()
        // se parsea el body
        do {
            urlRequest.httpBody = try encoder.encode(body)
        } catch {
            print("Fallo el parser")
            return nil
        }
        // se hace la petición
        let response = try await URLSession.shared.data(for: urlRequest)
        print(response)
        
        // valida peticion pero no es necesario acerlo aqui
        /*guard let response = response as? HTTPURLResponse,
              response.statusCode == 201 else {
            print("Error en la peticion")
            return nil
        }*/
        // retorna el response
        return response
    }
    
    func connectApiProtectGET(path: String, method:methodsHTTP )async throws -> (Data, URLResponse)? {
        // se valida el url
        guard let url = URL(string: url_base + path)
        else {
            print("Error en url")
            return nil
        }
        // se prepara la peticion
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.toString
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        

        // se hace la petición
        let response = try await URLSession.shared.data(for: urlRequest)
        print(response)
        
        // valida peticion pero no es necesario acerlo aqui
        /*guard let response = response as? HTTPURLResponse,
              response.statusCode == 201 else {
            print("Error en la peticion")
            return nil
        }*/
        // retorna el response
        return response
    }
    
    // Con @scaping ignora los errores
    // se le pasa el callback que retornara el response
    func fetchMovements()async throws -> HTTPURLResponse?{
        // similar a un tryCatch, se usa para validar el url (validaciones simples)
        guard let url = URL(string: url_base)
        else {
            print("URL no valido")
            return nil
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
                        
                    }catch{
                        print("Error in dispatch")
                    }
                }
            }
        }.resume() // se usa para decirle a quien lo consuma que se completo la tarea
        return nil
    }
}
