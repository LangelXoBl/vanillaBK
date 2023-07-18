//
//  EditUserData.swift
//  vanillaBK
//
//  Created by IMAC_02 on 19/06/23.
//

import SwiftUI




struct EditUserData: View {
    @State  var username: String = ""
    @State  var last_name: String = ""
    @State  var email: String = ""
    @State  var phone: String = ""
    @State  var account: String = ""
    @State  var rfc: String = ""
    

    var body: some View {
        
        
        VStack{
            VStack{
                VStack {
                    Spacer()
                    Text("Mi perfil").font(.system(size: 25))
                    Spacer()
                    Text(String(account)).font(.system(size: 27))
                    Spacer()
                }.frame(width: 350, height: 170).background(Color .blue .opacity(0.6)).cornerRadius(20)
                TextField("New username", text: $username)
                    .padding(15)
                    .frame(width: 320, height: 50)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(14).padding(.top, 15.0)
                
                TextField("New Last name", text: $last_name)
                    .padding(15)
                    .frame(width: 320, height: 50)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(14).padding(.top, 15.0)
                TextField("New Phone", text: $phone)
                    .padding(15)
                    .frame(width: 320, height: 50)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(14).padding(.top, 15.0)
                
                TextField("New Email", text: $email)
                    .padding(15)
                    .frame(width: 320, height: 50)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(14).padding(.top, 15.0)
                TextField("New RFC", text: $rfc)
                    .padding(15)
                    .frame(width: 320, height: 50)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(14).padding(.top, 15.0)
                
                Button("Enviar")
                {
                    Task{
                        do{
                            let rs = try await APIBK().updateUser(user: UserReq(name: username, lastname: last_name, email: email, rfc: rfc, phone: phone, password: "pass", id_bank: 10))
                            
                            if let affected = rs?.affected{
                                print("update Exitoso")
                            }
                        }catch{
                            print("Error al actualizar")
                        }
                    }
                    
                    
                }.padding(.top, 18.0).buttonStyle(ButtonGeneric())
            }.padding(300).background(Color .blue .opacity(0.6))
            
        }
    }
    
    struct EditUserData_Previews: PreviewProvider {
        static var previews: some View {
            EditUserData()
        }
    }
}
