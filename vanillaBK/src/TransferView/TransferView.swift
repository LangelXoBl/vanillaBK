//
//  TransferView.swift
//  vanillaBK
//
//  Created by IMAC 04 on 25/05/23.
//

import SwiftUI
struct PrimaryButtonStyle: ButtonStyle {
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
struct TransferView: View {
        @State private var importe: String = ""
        @State private var cuentaDestino: String = ""
        @State private var concepto: String = ""
        let ntf = NotificationHandler(title: "Transferencia bancaria", subititle: "Exitosa", body: "Se ha realizado la transferencia desde tu banca de preferencia")
        var body: some View {
            ZStack{
                VStack{
                    VStack{
                        Text("Transferencia Bancaria ").font(.title)
                            .foregroundColor(.gray)
                            .lineLimit(nil)
                            .padding(.all, 60.0).background(Color.white)

                        VStack{
                            Text("Bienvenido, Jonathan Valdes")
                            Text("Tu saldo es:")
                            Text("$50,000.00")
                        }.frame(width: 400.0, height: 200.0).aspectRatio(contentMode: .fit).cornerRadius(10)
                    }.ignoresSafeArea().background(Color(hue: 0.125, saturation: 0.766, brightness: 1.0))
                    VStack{
                        Text("Importe").padding(.leading, -170)
                        
                        TextField("Monto $ ", text: $importe).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.941))
                            .padding(20)
                            .underline()
                        Text("Cuenta destino")
                            .padding(.leading, -170)
                        TextField("Cuenta de banco", text: $cuentaDestino)
                            .padding(20)
                            .border(.gray)
                            .cornerRadius(10)
                        Text("Concepto")
                            .padding(.leading, -170.0)
                        TextField("Descripción de tranferencia", text: $concepto)
                            .padding(20)
                            .border(.gray)
                            .cornerRadius(10)
            
                        Button("Enviar") {
                            ntf.body = "Envio de $ \(importe) Exitoso, con el concepto: \(concepto)"
                            ntf.showNotification()
                          print("enviado")
                        }
                        .padding(.top, 18.0)
                        .buttonStyle(PrimaryButtonStyle())
                    }.ignoresSafeArea().padding(20).background(Color.white)
                    }
                    
                    
            }
            
        }
}
struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
