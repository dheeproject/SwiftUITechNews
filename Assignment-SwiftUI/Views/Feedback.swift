//
//  Feedback.swift
//  Assignment-SwiftUI
//
//  Created by Unthinkable-mac-0040 on 14/06/21.
//

import SwiftUI

struct FeedbackView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("Happy")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding()
        Text("Thank you, Your feedback is recorded")
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding()
            .font(.system(size: 18))
        }
        }
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
