//
//  MovementCardView.swift
//  vanillaBK
//
//  Created by imac_01 on 19/06/23.
//

import SwiftUI

struct MovementModel: Identifiable {
        let id = UUID()
        var monto: Int
        var fecha: String
        var concepto: String
        var icon: Image
        var status: Int //0 pendiete | 1 completado
}
var movementBase = MovementModel(monto: 100, fecha: "2023-02-13", concepto: "compra de picsa", icon: Image(systemName: "checkmark.circle.fill"), status: 0)

struct MovementCardView: View {
    var movement : MovementModel
   
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
        }.padding(10)
            .background(.gray.opacity(0.25))
    }
}

struct MovementCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovementCardView(movement: movementBase)
    }
}
