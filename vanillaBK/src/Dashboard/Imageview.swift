//
//  Imageview.swift
//  vanillaBK
//
//  Created by IMAC 11 on 29/05/23.
//

import SwiftUI

struct Imageview: View {
    var body: some View {
        Image("VanillaBk").resizable().frame(width: 200, height: 140)
    }
}

struct Imageview_Previews: PreviewProvider {
    static var previews: some View {
        Imageview()
    }
}
