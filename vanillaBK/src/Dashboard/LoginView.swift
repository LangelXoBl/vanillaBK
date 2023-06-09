import SwiftUI


struct LoginView: View {
    @State private var username:
    String = ""
    @State private var password:
    String = ""
    @State private var keep:
    Bool = false
    var body: some View {
        NavigationView{
            VStack {
                Text("Login")
                TextField("username", text: $username)
                TextField("username", text: $password)
                Toggle(isOn: $keep){
                    Text("Mantener session")
                }
                NavigationLink(destination:MainView() ){
                    Text("Login")
                }.simultaneousGesture(TapGesture().onEnded{
                    print("tab")
                    UserDefaults.standard.set(username, forKey: "user")
                    UserDefaults.standard.set(password, forKey: "pass")
                    
                })
            }
        }
    }
}

struct MainView: View {
    @State var user = UserDefaults.standard.string(forKey: "user") ?? "NA"
    @State var pass = UserDefaults.standard.string(forKey: "pass") ?? "NA"
    var body: some View {
        VStack{
            Text("Data View")
            Text(user)
            Text(pass)
        }.onAppear{
            user = UserDefaults.standard.string(forKey: "user") ?? "NA"
            pass = UserDefaults.standard.string(forKey: "pass") ?? "NA"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
