//
//  NavView.swift
//  vanillaBK
//
//  Created by imac_01 on 08/06/23.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        TabView{
            Dashboardview().tabItem{
                Image(systemName: "1.circle")
                Text("Dashboard")
            }
            MovementsView().tabItem{
                Image(systemName: "2.circle")
                Text("movimeinto")
            }
            TransferView().tabItem{
                Image(systemName: "3.circle")
                Text("movimeinto")
            }
        }
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
