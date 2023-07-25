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
    var data: DataRes?
    var message: String?
    var errors: [Errors]?
    
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

struct Errors: Codable {
    var property: String
}

struct loginReq: Codable {
    var phone: String
    var password: String
}

struct loginResp: Codable{
    var status: String?
    var access_token: String?
    var message: String?
}

struct DetailResp: Codable {
    var status: String
    var data: DataDetail
    var message: String?
}

struct DataDetail: Codable {
    var id: Int
    var id_user: Int
    var balance: Int
    var status: Int
    var card: [CardUser]
    var user: DataRes
}
struct CardUser: Codable {
    var id: Int
    var id_account: Int
    var card: String
    var card_account: String
    var status: Int
}

class APIBK: ObservableObject{
    @Published var movements = [movement]()
    
    
    func register( request: UserReq) async throws -> UserResp?{
        
        let response = try await CentralBankAPI2().connectApi(path: "/users", method: methodsHTTP.POST, body: request)
        
        // se destructura el response
        guard let (data, response) = response else {
            print("fue nil")
            return nil
        }
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode != 500 else {
            print("Error en la peticion")
            return nil}
        
        if response.statusCode == 400 {
            print("Erro en los datos")
        }
        
        let loginResponse = try JSONDecoder().decode(UserResp.self, from: data)
        print(loginResponse)
        return loginResponse
    }
    
    
    func login(user:loginReq) async throws -> loginResp?{
        let response  = try await CentralBankAPI2().connectApi(path: "/auth/login", method: methodsHTTP.POST, body: user)
        guard let (data, response) = response else {
            print("fue nil")
            return nil
        }
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode != 500 else {
            print("Error en la peticion")
            return nil}
        let loginResponse = try JSONDecoder().decode(loginResp.self, from: data)
        print(loginResponse)
        return loginResponse
    }
    
    func getUserData() async throws  -> DetailResp? {
        let response  = try await CentralBankAPI2().connectApiProtectGET(path: "/accounts/me", method: methodsHTTP.GET)

        guard let (data, response) = response else {
            print("fue nil")
            return nil
        }
        
       
        guard let response = response as? HTTPURLResponse,
              response.statusCode != 201 else {
            print("Error en la peticion")
            return nil}
        
        let detailResponde = try JSONDecoder().decode(DetailResp.self, from: data)
        print("doceode \(detailResponde)")
        return detailResponde
    }
    
    func newTransfer(body: NewTransfer) async throws -> Responsetransfer? {
        do {
            let response = try await CentralBankAPI2().connectApi(path: "/transferences", method: methodsHTTP.POST, body: body)
            guard let (data, response) = response else {
                print("fue nil")
                return nil
            }
            
            
            guard let response = response as? HTTPURLResponse
                   else {
                print("Error en la peticion")
                return nil}
            
            let dataRes = try JSONDecoder().decode(Responsetransfer.self, from: data)
            print("docode \(dataRes)")
            return dataRes
        }
        catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    func getTransfers() async throws  -> responseTransferList? {
        do {
                let response = try await CentralBankAPI2().connectApiProtectGET(path: "/transferences", method: methodsHTTP.GET)
                        
                    guard  let (data, response) = response else {
                    print("Respuesta o data nula")
                    return nil
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    print("Error en la peticion")
                    return nil
                }

                let detailResponse = try JSONDecoder().decode(responseTransferList.self, from: data)
                print("decodificado: \(detailResponse)")
                return detailResponse
            } catch {
                print("Error: \(error)")
                return nil
            }
    }
    
    func getDetailTransfer(id: Int) async throws -> respoDetailTransfer?{
        do {
                let response = try await CentralBankAPI2().connectApiProtectGET(path: "/transferences/\(id)", method: methodsHTTP.GET)
                        
                    guard  let (data, response) = response else {
                    print("Respuesta o data nula")
                    return nil
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    print("Error en la peticion")
                    return nil
                }

                let detailResponse = try JSONDecoder().decode(respoDetailTransfer.self, from: data)
                print("decodificado: \(detailResponse)")
                return detailResponse
            } catch {
                print("Error: \(error)")
                return nil
            }
    }
    
    func updateUser(user:UserReq) async throws -> updateUserResp?{
        let response  = try await CentralBankAPI2().connectApi(path: "/users", method: methodsHTTP.PATCH, body: user)
        guard let (data, response) = response else {
            print("fue nil")
            return nil
        }
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            print("Error en la peticion")
            return nil}
        let loginResponse = try JSONDecoder().decode(updateUserResp.self, from: data)
        print(loginResponse)
        return loginResponse
    }
    // Deprecated
    let url_base = "https://c2df-187-188-58-190.ngrok-free.app"
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
