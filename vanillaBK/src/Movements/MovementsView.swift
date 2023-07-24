//
//  MovementsView.swift
//  vanillaBK
//
//  Created by IMAC 03 on 22/05/23.
//

import SwiftUI
import ModalView

struct movements: Identifiable {
    let id = UUID()
    var monto: Int
    var fecha: String
    var concepto: String
    var icon: Image
    var status: Int //0 pendiete | 1 completado
    // Detalles
}

struct Movement: View{
    var movement = movements(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0)
   
    var body: some View{
        HStack{
            movement.icon
            VStack{
                Text(movement.fecha)
                Text(movement.concepto)
            }
            Spacer()
            VStack{
                Text("$"+String( movement.monto))
                Text(movement.status==0 ?"Pendiente":"Completado")
            }
        }.background(.gray).padding(.horizontal,40)
    }
}

struct MovementsView: View {
    @State private var data: [Transfer] = []
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Transferencias").padding(.top , (20))
                //lista
                List(data){transfer in
                    ModalPresenter{
                        ModalLink(destination: TransferencesDetail(item:transfer)){
                            HStack(){
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                Text("$ "+String( transfer.amount))
                                Spacer()
                            }.padding(10)
                                .background(.blue.opacity(0.25))
                        }
                    }.scrollContentBackground(.hidden)
                }
            }
            
        }.onAppear{
            Task{
                do {
                    let rs = try await APIBK().getTransfers()
                    if let result = rs{
                        data = result.data
                        print("peticion exitosa" + result.status)
                    }
                }catch{
                    print("Erro al traer lista")
                }
            }
        }
    }
}

struct DetailMovementView: View{
    let item: Transfer
    @State private var data: detailTransfer?
    
    var body: some View{
        VStack{
            Text(String( item.amount))
            if let detail = data{
                Text(detail.sender_account)
            } else {
                Text("Erro al obtener datos, intentelo nuevamente")
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

struct MovementsView_Previews: PreviewProvider {
    static var previews: some View {
        MovementsView()
        //Movement()
        //Login()
    }
}


// parte del ejemplo de fecth

struct Login: View{
    var body: some View{
        VStack{
            Text("HOLa").onAppear(){CentralBankAPI()
                .fetchMovements{( movements) in
                    print("Moviemientos")
                    print(movements)}}
        }
    }
}
