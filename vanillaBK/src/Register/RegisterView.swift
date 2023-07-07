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
            .frame(width: 320, height: 50)
            .foregroundColor(.black)
            .background(
                configuration.isPressed ? Color(red: 0.5098039215686274, green: 0.5803921568627451, blue: 0.7686274509803922 , opacity: 1.0) : Color(red: 0.5098039215686274, green: 0.5803921568627451, blue: 0.7686274509803922)
            ).cornerRadius(14)
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
    @State private var showtoast: Bool = false
    @State private var message: String = ""
    var api = APIBK()
       
       var body: some View {
          
           VStack{
               Text("Registro").font(.system(size: 60)).fontWeight(.bold)
                                   .foregroundColor(.black)
                                   .lineLimit(14)
                               HStack{
                                   TextField("Nombre", text: $nombreUsuario)
                                       .padding(15)
                                       .frame(width: 320, height: 50)
                                       .background(Color.black.opacity(0.05))
                                       .cornerRadius(14)
                               }.padding(4)
                               HStack{
                                   TextField("Apellidos", text: $lastname)
                                       .padding(15)
                                       .frame(width: 320, height: 50)
                                       .background(Color.black.opacity(0.05))
                                       .cornerRadius(14)
                               }.padding(4)
                              
                               HStack{
                                   TextField("email@example.com", text: $email)
                                       .padding(15)
                                       .frame(width: 320, height: 50)
                                       .background(Color.black.opacity(0.05))
                                       .cornerRadius(14)
                               }.padding(4)
                           
                               HStack{
                                   TextField("RFC", text: $rfcUsuario)
                                       .padding(15)
                                       .frame(width: 320, height: 50)
                                       .background(Color.black.opacity(0.05))
                                       .cornerRadius(14)
                               }.padding(4)
                               
                                   
                               Group{
                                   HStack{
                                       TextField("Teléfono", text: $numTelefono)
                                           .padding(15)
                                           .frame(width: 320, height: 50)
                                           .background(Color.black.opacity(0.05))
                                           .cornerRadius(14)
                                   }.padding(4)
                                   HStack{
                                       SecureField("Contraseña", text: $contraseña)
                                            .padding(15)
                                            .frame(width: 320, height: 50)
                                            .background(Color.black.opacity(0.05))
                                            .cornerRadius(14)
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
                       
                   }
                   .fontWeight(.bold)
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
