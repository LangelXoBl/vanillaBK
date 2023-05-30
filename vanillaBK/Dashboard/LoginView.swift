import SwiftUI

struct LoginView: View {
    @State var Username: String = ""
    @State var Password: String = ""
    @State var keep: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                TextField("username", text: $Username)
                TextField("Password", text: $Password)
                NavigationLink(destination: MainView()) {
                    Text("login")
                }
                Toggle(isOn: $keep) {
                    Text("Mantener sesion")
                }
            }
        }
    }
}

struct MainView: View{
    var body: some View{
        VStack {
            Text("Data View")
            Text("Data")
            Text("Data 2")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
