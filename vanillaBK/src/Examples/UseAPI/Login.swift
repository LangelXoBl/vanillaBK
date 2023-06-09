//
//  Login.swift
//  vanillaBK
//
//  Created by imac_01 on 05/06/23.
//

import SwiftUI

struct Login: View {
    @State var Username: String = ""
    @State var Password: String = ""
    @State var keep: Bool = false
    var body: some View {

            VStack {
                Text("Login")
                TextField("username", text: $Username)
                TextField("Password", text: $Password)
                
                Button("login"){
                    Task{
                        let rs = try await
                        CentralBankAPI()
                            .login(request: LoginReq(username: Username, password: Password))
                        print(rs ?? "Error en el login")
                    }
                }
                
            }
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
