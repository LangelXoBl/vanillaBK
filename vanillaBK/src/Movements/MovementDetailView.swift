//
//  MovementDetailView.swift
//  vanillaBK
//
//  Created by imac_01 on 19/06/23.
//

import SwiftUI



struct MovementDetailView: View {
    let item: MovementModel
    var body: some View{
        VStack{
            Text(item.concepto)
            
        }
    }
}

struct MovementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovementDetailView(item: movementBase)
    }
}
