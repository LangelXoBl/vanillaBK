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
        @State private var concepto: String = ""
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
                TextField("Monto $ ", text: $importe).background(Color.white)
                    .padding(20)
                    .border(.gray, width:1)
                    .cornerRadius(10)
                Text("Cuenta destino")
                    .padding(.leading, -170)
                TextField("Cuenta de banco", text: $cuentaDestino)
                    .padding(20)
                    .border(.gray)
                    .cornerRadius(10)
                Text("Concepto")
                    .padding(.leading, -170)
                TextField("Descripción de tranferencia", text: $concepto)
                    .padding(20)
                    .border(.gray)
                    .cornerRadius(10)
                Button("Enviar")
                {
                    ntf.body = "Envio de $ \(importe) Exitoso, con el concepto: \(concepto)"
                    ntf.showNotification()
                  print("enviado")
                }
               
            }.padding(20)
           
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
