//
//  TransferView.swift
//  vanillaBK
//
//  Created by IMAC 04 on 25/05/23.
//

import SwiftUI

struct TransferView: View {
        @State private var importe: String = ""
        @State private var cuentaDestino: String = ""
        let ntf = NotificationHandler(title: "Transferencia bancaria", subititle: "Exitosa", body: "Se ha realizado la transferencia desde tu banca de preferencia")
        var body: some View {
            ZStack{
                Color.blue .opacity(0.2).edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Text("Transferencia Bancaria ").font(.system(size: 25)).fontWeight(.bold).padding(.bottom)
                    VStack{
                        Text("Bienvenido, Jonathan Valdes").padding(30)
                        Text("Tu saldo es:").padding(5)
                    }.padding(.leading).frame(width: 350.0, height: 200.0).aspectRatio(contentMode: .fit).background(Color.blue .opacity(0.6)).cornerRadius(10)
                        .font(.system(size: 20)).fontWeight(.bold)
                    VStack{
                        
                        VStack{
                            VStack{
                                Text("Datos bancarios").font(.system(size: 25)).fontWeight(.bold)
                            }
                            TextField("Monto $ ", text: $importe).padding(15)
                                .frame(width: 320, height: 50)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(14).padding(.top, 15.0)
                        }.padding(.top, 80.0)
                        VStack{
                            TextField("Cuenta de banco", text: $cuentaDestino)
                                .padding(15)
                                    .frame(width: 320, height: 50)
                                    .background(Color.white.opacity(0.6))
                                    .cornerRadius(14)
                          
                        }.padding(.top, 15.0)
                       
                        Button("Enviar")
                        {
                            ntf.body = "Envio de $ \(importe) Exitoso, a la cuenta: \(cuentaDestino)"
                            ntf.showNotification()
                          print("enviado")
                        }.padding(.top, 18.0).buttonStyle(ButtonGeneric())

                    }
                  
                   
                }
    //termina ZStack
            }
            
           
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
