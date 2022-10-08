

import SwiftUI

struct LoginView: View {
    var languageCode: Int //This given returnlanguagecode which return right official apple language code
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var password: String = ""
    func changelogin(){
        Constant.currentLogin = name
    }
    var body: some View {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.yellow, .red]), center: .center, startRadius: 150, endRadius: 450)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: CGFloat(40.0)) {
                    Text("Tech News".localizableString(loc: returnLanguageCode(languageIndex: languageCode)))
                        .font(.title)
                        .foregroundColor(Color.white)
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.secondary)
                        TextField(LocalizeString.placeholders.name.localizableString(loc: returnLanguageCode(languageIndex: languageCode)), text: $name)
                            .foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    HStack {
                        Image("vpn_key")
                            .resizable()
                            .frame(width: 16.0, height: 16.0) .foregroundColor(.secondary)
                        SecureField(LocalizeString.placeholders.password.localizableString(loc: returnLanguageCode(languageIndex: languageCode)), text: $password)
                            .foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    NavigationLink(
                        destination: ContentView(navbar: false, loggedInAs: "Dheeraj".localizableString(loc: returnLanguageCode(languageIndex: languageCode)), showTab: true).navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(perform: {
                            Constant.currentLogin="Dheeraj"
                        }).onDisappear(perform: {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                        }),
                        label: {
                            Text("Login".localizableString(loc: returnLanguageCode(languageIndex: languageCode)))
                        }).disabled(name != "Dheeraj" && password != "123")
                        .frame(width: 80, height: 50, alignment: .center)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    
                }.padding(.horizontal, CGFloat(40.0))
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(languageCode: 1)
    }
}
