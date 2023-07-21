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
    
    let url_base = "https://547f-187-188-58-190.ngrok-free.app"
    
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
}
