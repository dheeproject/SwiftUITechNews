
import SwiftUI
struct image{
   var id:Int
    var name:String
}
let images:[image]=[image(id: 1, name: "GITHUB"),image(id: 2, name: "STACKOVERFLOW"),image(id: 3, name: "APPLE"),image(id: 4, name: "MICROSOFT"),image(id: 5, name: "GOOGLE")]
struct Corousel: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x - 32)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(images, id: \.id) { num in
                            GeometryReader { proxy in
                                
                                NavigationLink(
                                    destination: Image(num.name),
                                    label: {
                                        VStack {
                                            let scale = getScale(proxy: proxy)
                                            
                                            Image(num.name)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                )
                                                .clipped()
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                                .scaleEffect(CGSize(width: scale, height: scale))
                                                .animation(.easeOut(duration: 0.5))
                                                
                                            
                                            Text(num.name)
                                                .padding(.top)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(.label))
                                        }
                                    })
                            }
                            .frame(width: 135, height: 250)
                                
                        }
                    }.padding(32)
                    
                }
                
                
                
            }.navigationTitle("OUR COVERAGE")
        }
    }
}

struct Corousel_Previews: PreviewProvider {
    static var previews: some View {
        Corousel()
    }
}
