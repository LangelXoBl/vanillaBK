//
//  TransferView.swift
//  vanillaBK
//
//  Created by IMAC 04 on 25/05/23.
//

import SwiftUI

struct TransferView: View {
        @State private var name: String = ""
        
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
                TextField("Monto $ ", text: $name).background(Color.white)
                    .padding(20)
                    .border(.gray, width:1)
                    .cornerRadius(10)
                Text("Cuenta destino")
                    .padding(.leading, -170)
                TextField("Cuenta de banco", text: $name)
                    .padding(20)
                    .border(.gray)
                    .cornerRadius(10)
                Text("Concepto")
                    .padding(.leading, -170)
                TextField("Descripción de tranferencia", text: $name)
                    .padding(20)
                    .border(.gray)
                    .cornerRadius(10)
                Spacer()
               
            }.padding(20)
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
