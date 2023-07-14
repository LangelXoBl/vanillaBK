//
//  RegisterView.swift
//  vanillaBK
//
//  Created by imac_01 on 19/06/23.
//
import SwiftUI
struct RegisterView: View {
    @State private var nombreUsuario: String = ""
       @State private var lastname: String = ""
       @State private var email: String = "@gmail.com"
       @State private var rfcUsuario: String = ""
       @State private var numTelefono: String = ""
       @State private var contraseña: String = ""
       @State private var idBanco: Int = 10
    @State private var showtoast: Bool = false
    @State private var message: String = ""
    var api = APIBK()
       
       var body: some View {
          
           ZStack{
               Color.blue .opacity(0.2).edgesIgnoringSafeArea(.all)
               VStack{
                   Text("Registro").font(.system(size: 60)).fontWeight(.bold)
                                       .foregroundColor(.black)
                                       .lineLimit(14)
                                   HStack{
                                       TextField("Nombre", text: $nombreUsuario)
                                           .padding(15)
                                               .frame(width: 320, height: 50)
                                               .background(Color.white.opacity(0.6))
                                               .cornerRadius(14).padding(.top, 15.0)
                                   }.padding(4)
                                   HStack{
                                       TextField("Apellidos", text: $lastname)
                                           .padding(15)
                                               .frame(width: 320, height: 50)
                                               .background(Color.white.opacity(0.6))
                                               .cornerRadius(14).padding(.top, 15.0)
                                   }.padding(4)
                                  
                                   HStack{
                                       TextField("email@example.com", text: $email)
                                           .padding(15)
                                               .frame(width: 320, height: 50)
                                               .background(Color.white.opacity(0.6))
                                               .cornerRadius(14).padding(.top, 15.0)
                                   }.padding(4)
                               
                                   HStack{
                                       TextField("RFC", text: $rfcUsuario)
                                           .padding(15)
                                               .frame(width: 320, height: 50)
                                               .background(Color.white.opacity(0.6))
                                               .cornerRadius(14).padding(.top, 15.0)
                                   }.padding(4)
                                   
                                       
                                   Group{
                                       HStack{
                                           TextField("Teléfono", text: $numTelefono)
                                               .padding(15)
                                                   .frame(width: 320, height: 50)
                                                   .background(Color.white.opacity(0.6))
                                                   .cornerRadius(14).padding(.top, 15.0)
                                       }.padding(4)
                                       HStack{
                                           SecureField("Contraseña", text: $contraseña)
                                               .padding(15)
                                                   .frame(width: 320, height: 50)
                                                   .background(Color.white.opacity(0.6))
                                                   .cornerRadius(14).padding(.top, 15.0)
                                       }.padding(4)
                       Text(message).foregroundColor(.red)
                       Button("Registrar") {
                         print("enviado")
                           let userReq = UserReq(name: nombreUsuario, lastname: lastname, email: email, rfc: rfcUsuario, phone: numTelefono, password: contraseña, id_bank: 10)
                           Task{
                               do {
                                   let rs = try await api.register(request: userReq)
                                   if let result = rs?.message{
                                       message = result
                                   } else {message = "Creado con exito"}
                               }catch{
                                   print("Erro al cread")
                               }
                               
                           }
                           
                       }.buttonStyle(ButtonGeneric())
                       
                   }
                 
               }.padding(20)
           }
       }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
