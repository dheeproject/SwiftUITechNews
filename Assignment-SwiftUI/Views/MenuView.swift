

import SwiftUI

struct MenuContent: View {
    @State var menulanguage:Int
    var body: some View {
        List {
            Text("My Profile".localizableString(loc: returnLanguageCode(languageIndex: menulanguage))).onTapGesture {
                print("My Profile")
            }
            NavigationLink(
                destination: ContentView(navbar: true, loggedInAs: "Login", showTab: false),
                label: {
                    Text("Logout".localizableString(loc: returnLanguageCode(languageIndex: menulanguage)))
                })
            NavigationLink(
                destination: FeedbackView(feedbackLanguageCode: menulanguage),
                label: {
                    Text("Give us 5 star".localizableString(loc: returnLanguageCode(languageIndex: menulanguage)))
                })
            NavigationLink(
                destination: Corousel(),
                label: {
                    Text("See Our Coverage".localizableString(loc: returnLanguageCode(languageIndex: menulanguage)))
                })
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    @State var language:Int
    var body: some View {
        ZStack {
            HStack {
                MenuContent(menulanguage: language)
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}

struct MenuView: View {
    @State var menuOpen: Bool
    @State var languagemenu:Int
    var body: some View {
        
            SideMenu(width: 270,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu, language: languagemenu)
        
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuOpen: false, languagemenu: 1)
    }
}
