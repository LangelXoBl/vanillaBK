//
//  TransferView.swift
//  vanillaBK
//
//  Created by IMAC 04 on 25/05/23.
//

import SwiftUI

struct TransferView: View {
        @State private var importe: Int = 0
        @State private var cuentaDestino: String = "9448692199903896"
        @State private var concepto: String = ""
    @State private var message: String?
    let userAccount = "9580680860316257"
        let ntf = NotificationHandler(title: "Transferencia bancaria", subititle: "Exitosa", body: "Se ha realizado la transferencia desde tu banca de preferencia")
        var body: some View {
           
            VStack{
                
                Text("Transferencia Bancaria ").font(.title)
                    .foregroundColor(.gray)
                    .background(Color.white).padding(.bottom)
                VStack{
                    Text("Bienvenido, Jonathan Valdes").padding(30)
                    Text("Tu saldo es:").padding(5)
                    Text("$50,000.00")
                }.padding(.leading).frame(width: 350.0, height: 200.0).aspectRatio(contentMode: .fit).background(Color.gray).cornerRadius(10)
                Spacer()
                
                Text("Importe").padding(.leading, -170)
                TextField("Monto $ ", value: $importe, format: .number).background(Color.white)
                    .padding(20)
                    .border(.gray, width:1)
                    .cornerRadius(10)
                Text("Cuenta destino")
                    .padding(.leading, -170)
                TextField("Cuenta de banco", text: $cuentaDestino)
                    .padding(20)
                    .border(.gray)
                    .cornerRadius(10)
                Text(message ?? "").foregroundColor(message == "Complete" ? .green : .red)

                Button("Enviar")
                {
                    Task{
                        do {
                            let rs = try await APIBK().newTransfer(body: NewTransfer(user_account: userAccount, receptor_account: cuentaDestino, amount: importe))
                            if let result = rs?.message {
                                message = result
                            }else {message = "No account associated to user" }
                            if let data = rs?.data {
                                ntf.body = "Envio de $ \(data.amount) Exitoso, a la tarjeta: \(cuentaDestino)"
                                ntf.showNotification()
                              print("enviado")
                            }
                        }catch{
                            print("Error de transferencia")
                        }
                        
                    }
                    
                    
                }
               
            }.padding(20)
           
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
