//
//  RegisterView.swift
//  vanillaBK
//
//  Created by imac_01 on 19/06/23.
//

import SwiftUI

struct RegisterButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 350.0, height: 60.0)
            .foregroundColor(.white)
            .background(
                configuration.isPressed ? Color.blue.opacity(0.6) : Color.blue
            )
            .cornerRadius(10)
    }
}

struct RegisterView: View {
    @State private var nombreUsuario: String = ""
       @State private var lastname: String = ""
       @State private var email: String = "@gmail.com"
       @State private var rfcUsuario: String = ""
       @State private var numTelefono: String = ""
       @State private var contraseña: String = ""
       @State private var idBanco: Int = 10
    var api = APIBK()
       
       var body: some View {
          
           VStack{
               Text("Registro VanillaBK").font(.title)
                   .foregroundColor(.black)
                   .background(Color.white).padding(.bottom)
               Text("Nombre(s)").padding(.leading, -170)
               TextField("", text: $nombreUsuario)
                   .padding(15)
                   .border(.gray, width:1)
                   .cornerRadius(10)
               Text("Apellidos")
                   .padding(.horizontal, -170.0)
               TextField("", text: $lastname)
                   .padding(15)
                   .border(.gray)
                   .cornerRadius(10)
               Text("Email")
                   .padding(.leading, -170.0)
               TextField("email@example.com", text: $email)
                   .padding(15)
                   .border(.gray)
                   .cornerRadius(10)
               Text("RFC")
                   .padding(.leading, -170.0)
               TextField("", text: $rfcUsuario)
                   .padding(15)
                   .border(.gray)
                   .cornerRadius(10)
               Group{
                   Text("Telefono")
                       .padding(.leading, -170.0)
                   TextField("", text: $numTelefono)
                       .padding(15)
                       .border(.gray)
                       .cornerRadius(10)
                   Text("Contraseña")
                       .padding(.leading, -170.0)
                  SecureField("", text: $contraseña)
                       .padding(15)
                       .border(.gray)
                       .cornerRadius(10)
                   Button("Registrar") {
                     print("enviado")
                       var userReq = UserReq(name: nombreUsuario, lastname: lastname, email: email, rfc: rfcUsuario, phone: numTelefono, password: contraseña, id_bank: 10)
                       Task{
                           do {
                               let rs = try await api.register(request: userReq)
                               
                               print(rs ?? "Erro en vista")
                           }catch{
                               print("Erro al cread")
                           }
                           
                       }
                       
                   }
                   .padding(.top, 18.0)
                   .buttonStyle(RegisterButton())
               }
             
           }.padding(20)
   }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
