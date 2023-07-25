//
//  NavView.swift
//  vanillaBK
//
//  Created by imac_01 on 08/06/23.
//

import SwiftUI

struct NavView: View {
    @Binding var isAuth: Bool
    var body: some View {
        TabView{
            Dashboardview().tabItem{
                Image(systemName: "house")
                Text("Dashboard")
            }
            MovementsView().tabItem{
                Image(systemName: "arrow.up.right.and.arrow.down.left.rectangle.fill")
                Text("movimeinto")
            }
            UserProfile(isAuth: $isAuth).tabItem{
                Image(systemName: "person")
                Text("My Perfil")
            }
            
        }
    }
}

struct other: View{
    var body: some View{
        Text("NavView")
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(isAuth: .constant(true))
    }
}
