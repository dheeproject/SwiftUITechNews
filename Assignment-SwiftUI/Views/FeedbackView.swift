

import SwiftUI
// Triggers When User give feedback
struct FeedbackView: View {
    var feedbackLanguageCode:Int 
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(systemName: Constant.Feedback.thumbsup)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                Text(LocalizeString.Feedback.thankyou.localizableString(loc: returnLanguageCode(languageIndex: feedbackLanguageCode)))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding()
                    .font(.system(size: 18))
            }
        }
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(feedbackLanguageCode: 1)
    }
}
