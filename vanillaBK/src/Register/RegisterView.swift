//
//  RegisterView.swift
//  vanillaBK
//
//  Created by IMAC 04 on 19/06/23.
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
    @State private var email: String = ""
    @State private var rfcUsuario: String = ""
    @State private var numTelefono: String = ""
    @State private var contraseña: String = ""
    @State private var idBanco: Int = 7

    
    var body: some View {
        VStack{
            VStack{
                Text("Registro ").font(.title)
                    .foregroundColor(.black)
                    .background(Color.white).padding(.bottom)
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
                    Button("Registrar") {
                      print("enviado")
                    }
                    .fontWeight(.bold)
                    .padding(.top, 18.0)
                    .buttonStyle(RegisterButton())
                    HStack{
                        Text("ya tengo una cuenta")
                            .fontWeight(.bold)
                    }
                    
                }
            }.padding(300).background(Color(red: 0.9921568627450981, green: 0.8470588235294118, blue: 0.20784313725490197, opacity: 0))
        }
    }
        
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
