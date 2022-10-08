

import SwiftUI
struct Learning: Identifiable{
    let name:String
    let id:Int
}
struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var selectedIndex = 0 // Used in switch case for switching between tabs
    @State private var isShowingMenu=false
    @State var navbar:Bool
    @State var selectLanguage = 0//Changes its value when language changes, see Choose English button to get more insight
    @State var languageDisplay = "Hindi"  
    @State var name:String = ""// To be used by learning tab for populating list
    @State var generateid = 4 // Generates id for learning array
    @State var loggedInAs: String  // View will notified of current login by this
    @State var showTab: Bool //if given true show tab else not
    @State var navi:Bool = false
    @State var learningArr=[Learning(name: Constant.NewsLearnings.news1, id: 1), Learning(name: Constant.NewsLearnings.news2, id: 2), Learning(name: Constant.NewsLearnings.news3, id: 3)]
    let tabBarImageNames=[Constant.TabBarImages.person, Constant.TabBarImages.pencil, Constant.TabBarImages.feedback]
    var body: some View {
        VStack{
            ZStack{
                switch selectedIndex{
                case 0:NavigationView {
                    List(networkManager.posts) { post in
                        NavigationLink(destination: DetailView(url: post.url)) {
                            Text(post.title)
                        }
                    }
                    .navigationBarTitle("Tech News".localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading){
                            NavigationLink(
                                destination: MenuView(menuOpen: true, languagemenu: selectLanguage),
                                isActive:$isShowingMenu, label: {
                                    Text("".localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                                })
                            Button("Menu".localizableString(loc: returnLanguageCode(languageIndex: selectLanguage))){
                                self.isShowingMenu=true
                                self.showTab=false
                            }
                        }
                        ToolbarItemGroup(placement: .navigationBarTrailing){
                            NavigationLink(
                                destination: LoginView(languageCode: selectLanguage).navigationBarHidden(false).onAppear(perform: {
                                    showTab=false
                                }),
                                label: {
                                    Text(loggedInAs.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                                })
                        }
                        ToolbarItemGroup(placement: .principal){
                            HStack{
                                Text("Choose-")
                                Button(languageDisplay){
                                    if selectLanguage == 0{
                                        selectLanguage=1
                                        languageDisplay="English"
                                        changeLearningArray()
                                    }
                                    else{
                                        selectLanguage=0
                                        languageDisplay="Hindi"
                                        changeLearningArray()
                                    }
                                }
                                .navigationBarHidden(true)
                            }
                            .statusBar(hidden: true)
                        }
                    }
                }
                .onAppear {
                    self.networkManager.fetchData()
                }
                
                case 1: NavigationView{
                    VStack{
                        List(learningArr){
                            student in
                            Text(student.name)
                        }
                        .navigationBarTitle(LocalizeString.Navigation.learningTitle.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                        HStack{
                            TextField(LocalizeString.placeholder.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)), text: $name ).textFieldStyle(RoundedBorderTextFieldStyle())
                            Button(action: {
                                learningArr.append(Learning(name: self.name, id: generateid))
                                generateid = generateid+1
                            }) {
                                Text("Add".localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                            }
                        }.padding()
                    }.navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                }
                default:
                    NavigationView{
                        HStack{
                            VStack{
                                Image(Constant.Feedback.loveImage)
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding()
                                NavigationLink(
                                    destination: FeedbackView(feedbackLanguageCode: selectLanguage),
                                    label: {
                                        Text(LocalizeString.Feedback.loveText.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                                    })
                            }
                            Spacer()
                            VStack{
                                Image(Constant.Feedback.satisfiedImage)
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding()
                                NavigationLink(
                                    destination: FeedbackView(feedbackLanguageCode: selectLanguage),
                                    label: {
                                        Text(LocalizeString.Feedback.satisfiedText.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                                    })
                            }
                            Spacer()
                            VStack{
                                Image(Constant.Feedback.sadImage)
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipShape(Circle())
                                    .padding()
                                NavigationLink(
                                    destination: FeedbackView(feedbackLanguageCode: selectLanguage),
                                    label: {
                                        Text(LocalizeString.Feedback.sadText.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                                    })
                            }
                        }.padding()
                        .navigationBarTitle(LocalizeString.Navigation.feedbackTitle.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)))
                    }
                }
            }
            Spacer()
          
            HStack{
                if showTab == true {
                    ForEach(0..<3){ num in
                        Button(action: {
                            selectedIndex=num
                        }, label: {
                            Spacer()
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex==num ? Color(.black):.init(white:0.7))
                            Spacer()
                        })
                    }
                    
                }
            }
        }
    }
    /**
     Triggers to update learning data when ever language changes
     */
    func changeLearningArray(){
        learningArr=[Learning(name: LocalizeString.NewsLearnings.news1.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)), id: 1), Learning(name: LocalizeString.NewsLearnings.news2.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)), id: 2), Learning(name: LocalizeString.NewsLearnings.news3.localizableString(loc: returnLanguageCode(languageIndex: selectLanguage)), id: 3)]
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(navbar: false, loggedInAs: Constant.currentLogin, showTab: true)
    }
}
extension String{
    func localizableString(loc: String)->String{
        let path=Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle=Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
/**
 Triggers to get the correct code for a particulate language according selectLanguage input
 
 - Parameters:
 - languageIndex: Tell which language code to be return
 - Returns: language code according language  Index
 */
func returnLanguageCode(languageIndex: Int)->String{
    if languageIndex==0{
        return "en"
    }
    else{
        return "hi"
    }
}
