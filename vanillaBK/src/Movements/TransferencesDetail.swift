//
//  TransferencesDetail.swift
//  vanillaBK
//
//  Created by IMac_01_Invitado on 20/07/23.
//

import SwiftUI



    struct TransferencesDetail: View {
        
        let item: Transfer
        @State private var data: detailTransfer?
        
        @State private var importe: Int = 0
        @State private var status : String = "q"
        @State private var cuentaDestino: String = "9448692199903896"
        @State private var CuentaEnvio: String = ""
        @State private var message: String?
        let userAccount = "9580680860316257"
        let ntf = NotificationHandler(title: "Detalle de transferencia", subititle: "Exitosa", body: "Se ha realizado la transferencia desde tu banca de preferencia")
        var body: some View {
            ZStack{
                Color.blue .opacity(0.2).edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Text("Detalle de transferencia ").font(.system(size: 25)).fontWeight(.bold).padding(.bottom)
                    if let detail = data{
                        VStack{
                            Text("Monto tranferido")
                            Text(detail.amount, format: .number).fontWeight(.none)
                            Text("Estatus")
                                
                            Text("Success").fontWeight(.none)
                        }.padding(.leading).frame(width: 350.0, height: 200.0).aspectRatio(contentMode: .fit).background(Color.blue .opacity(0)).cornerRadius(10)
                            .font(.system(size: 20)).fontWeight(.bold)
                        
                        
                        VStack{
                            VStack{
                                Text("Datos de transferencia").font(.system(size: 25)).fontWeight(.bold)
                            }
                            Text("Cuenta envio ").padding(.top, 15.0)
                            Text(detail.sender_account).padding(15)
                                .frame(width: 320, height: 50)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(14)
                        }.padding(.top, 15.0)
                        VStack{
                            Text("Cuenta destino")
                            Text(detail.receptor_account)
                                .padding(15)
                                .frame(width: 320, height: 50)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(14)
                            
                        }.padding(.top, 5.0)
                        Text(message ?? "").foregroundColor(message == "Complete" ? .green : .red)
                        
                        Button("Reportar cargo")
                        {
                            print("Reporte enviado")
                            
                            
                        }.padding(.top, 18.0).buttonStyle(ButtonGeneric())
                        //termina ZStack
                    }else {
                        Text("Erro al obtener datos, intentelo nuevamente")
                    }
                }
                
            }.onAppear{
                
                Task{
                    do {
                        let rs = try await APIBK().getDetailTransfer(id: item.id)
                        if let result = rs{
                            data = result.data
                            print("peticion exitosa" + result.status)
                        }
                    }catch{
                        print("Erro al traer lista")
                    }
                }}
        }
        
    }

struct TransferencesDetail_Previews: PreviewProvider {
    static var previews: some View {
        TransferencesDetail(item:  Transfer(id: 2, amount: 10))
    }
}

