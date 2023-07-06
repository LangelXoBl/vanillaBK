//
//  MovementsView.swift
//  vanillaBK
//
//  Created by IMAC 03 on 22/05/23.
//

import SwiftUI

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
    var data=[
        movements(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),movements(monto: -100, fecha: "2023-02-13", concepto: "compra de coca", icon: Image(systemName: "checkmark.circle.fill"), status: 1),movements(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        movements(monto: -1200, fecha: "2023-02-13", concepto: "compra de hamburguesa", icon: Image(systemName: "checkmark.circle.fill"), status: 1),
        movements(monto: -100, fecha: "2023-02-13", concepto: "compra de sandia", icon: Image(systemName: "checkmark.circle.fill"), status: 1),movements(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        movements(monto: -1200, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 1)
        ,movements(monto: -100, fecha: "2023-02-13", concepto: "compra de chettos", icon: Image(systemName: "checkmark.circle.fill"), status: 1),movements(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        movements(monto: -1200, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 1),
        movements(monto: -100, fecha: "2023-02-13", concepto: "compra de pan", icon: Image(systemName: "checkmark.circle.fill"), status: 1),movements(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        movements(monto: -1200, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 1)
    ]
    
    var body: some View {
        NavigationView{
            VStack{
               
                //lista
                List(data){movement in
                    NavigationLink(destination: DetailMovementView(item:movement)){
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
                        }.padding(10)
                            .background(.gray.opacity(0.25))
                    }.scrollContentBackground(.hidden)
                }
            }}
    }
}

struct DetailMovementView: View{
    let item: movements
    var body: some View{
        VStack{
            Text(item.concepto)
            
        }
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
