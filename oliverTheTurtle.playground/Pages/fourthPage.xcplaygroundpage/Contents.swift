import SwiftUI
import PlaygroundSupport

struct scene1: View {
    @State var turtlePositionX: CGFloat = -414 - 200/2
    //    index for turtle walking
    @State var i: Int = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var turtlePositionY: CGFloat =  896/2 - 75
    
    var turtleWalking = ["turtle_run1.png", "turtle_run2.png"]
    @State var turtleImage = "turtle_run1.png"
    @State var theEnd: Double = 0
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "win_game_background.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 414)
            Image(uiImage: UIImage (named: turtleImage)!)
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .offset(x: 0, y: turtlePositionY)
                .animation(.easeOut(duration: 25.0), value: turtlePositionY)
                                        .onReceive(timer, perform: {_ in
                                            turtleImage = turtleWalking[i]
                                            i = i+1
                                            if i>1 {i=0}
                                        })
            Image(uiImage: UIImage (named: "final_sentence.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 380)
                .opacity(theEnd)
                .animation(.easeOut(duration: 5.0).delay(15), value: theEnd)
        }
        .frame(width: 414, height: 896)
        .onAppear{turtlePositionY = -896/2 - 150
            theEnd=1
        }
    }
    
}

PlaygroundPage.current.setLiveView(scene1())

//: [Previous](@previous)
