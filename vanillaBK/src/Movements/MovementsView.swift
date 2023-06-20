//
//  MovementsView.swift
//  vanillaBK
//
//  Created by IMAC 03 on 22/05/23.
//

import SwiftUI

struct MovementsView: View {
    var data=[
        MovementModel(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),MovementModel(monto: -100, fecha: "2023-02-13", concepto: "compra de coca", icon: Image(systemName: "checkmark.circle.fill"), status: 1),MovementModel(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        MovementModel(monto: -1200, fecha: "2023-02-13", concepto: "compra de hamburguesa", icon: Image(systemName: "checkmark.circle.fill"), status: 1),
        MovementModel(monto: -100, fecha: "2023-02-13", concepto: "compra de sandia", icon: Image(systemName: "checkmark.circle.fill"), status: 1),MovementModel(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        MovementModel(monto: -1200, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 1)
        ,MovementModel(monto: -100, fecha: "2023-02-13", concepto: "compra de chettos", icon: Image(systemName: "checkmark.circle.fill"), status: 1),MovementModel(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        MovementModel(monto: -1200, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 1),
        MovementModel(monto: -100, fecha: "2023-02-13", concepto: "compra de pan", icon: Image(systemName: "checkmark.circle.fill"), status: 1),MovementModel(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0),
        MovementModel(monto: -1200, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 1)
    ]
    @State private var search:
    String = ""
    var body: some View {
        NavigationView{
            VStack{
                //titulo
                Text("Movimientos").font(.title)
                
                //lista
                List(data){movement in
                    NavigationLink(destination: MovementDetailView(item:movement)){
                        MovementCardView(movement: movement)
                    }.scrollContentBackground(.hidden)
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
