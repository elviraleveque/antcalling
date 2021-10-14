import SwiftUI
import PlaygroundSupport

struct scene1: View {

    //    index for dialogues
    @State var d: Int = 0
    @State var kidOpacity: Double = 0
    @State var hideButton: Double = 1
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var speaker = [
        "",
        "",
        "",
        "",
        "Kid:",
        "Kid:",
        "Kid:",
        ""
    ]
    var dialogues = [
        "*A few months later...*",
        "*crack*",
        "*crack*",
        "*crack*",
        "Hey baby turtle, I saw you are in trouble, do you need help?",
        "Ohh you need to reach the sea, but the beach is too dirty to be crossed by a baby turtle like you!",
        "Even if I’m just a kid, I’ll do my best to help you. ",
        "*Start the game in the next page*"
    ]
    var turtleBorning = ["egg_1.png", "egg_2.png", "egg_3.png", "egg_4.png", "egg_4.png", "beach_first_page.png", "beach_first_page.png", "beach_first_page.png"]
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: turtleBorning[d])!)
                .resizable()
                .scaledToFit()
                .frame(width: 414)
            Image(uiImage: UIImage (named: "BAMBINO_SALUTO_1.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .offset(x:100, y:-20)
                .opacity(kidOpacity)
            VStack {
                Spacer()
                VStack {
                    Text(dialogues[d])
                        .padding(30)
                    
                    Button("Next >", action: {
                        d += 1
                        print(d)
                        if d >= 5 {
                            kidOpacity = 1
                        }
                        if d > 6 {
                            hideButton = 0

                        }
                    }
                    )
                        .padding(.bottom, 30)
                        .opacity(hideButton)
                    //                    NavigationLink(destination: scene2(), label: {})
                }
                .foregroundColor(.black)
                .frame(width: 395)
                .background(Color(red: 1.0, green: 0.95, blue: 0.87))
                .cornerRadius(15)
                
            }
            .frame(height: 896)
            .padding(.bottom, 30)
        }
        .frame(width: 414, height: 896)
    }
}

PlaygroundPage.current.setLiveView(scene1())

//: [Previous](@previous)    [Next](@next)
