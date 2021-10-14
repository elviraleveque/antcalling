import SwiftUI
import PlaygroundSupport
import Darwin
import AVFoundation

struct scene1: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var turtlePositionX: CGFloat = -414 - 200/2
    //    index for turtle walking
    @State var i: Int = 0
    //    index for dialogues
    @State var d: Int = 0
    @State var turtleImages = "turtle_mama.png"
    var dialogues = [
        "I’m so tired, I’ve been travelling since so long through this pollution... ",
        "...but I can’t stop now. I need to find a safe place for my kids.",
        "Here. Here my eggs will be in safe.",
        "Now That i found a place for you, I can leave in peace. "
    ]
    var turtleWalking = ["turtle_mama.png", "turtle_mama_walk.png"]
    
    @State var audioPlayer: AVAudioPlayer?

    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }
    
    
  
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "mare_scena_1.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 414)
            Image(uiImage: UIImage (named: turtleImages)!)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .offset(x: turtlePositionX, y: 0)
                .animation(.easeOut(duration: 10.0), value: turtlePositionX).onReceive(timer, perform: {_ in
                    turtleImages = turtleWalking[i]
                    i = i+1
                    if i>1 {i=0}
                })
            Image(uiImage: UIImage(named: "mare_scena_1.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 414)
                .opacity(0.3)
            VStack {
                Spacer()
                VStack {
                    Text("Turtle Mama:")
                        .font(.system(size: 20, weight: .bold))
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 2, trailing: 30))

                    Text(dialogues[d])
                        .font(.system(size: 20, weight: .regular ))
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 2, trailing: 30))
                    HStack {
                        Spacer()
                        Button("Next ›", action: {
                            turtlePositionX = 414 + 200/2
                            d += 1
                            if d > 1 {
                                PlaygroundPage.current.setLiveView(scene2())
                                
                            }
                            
                        })
                            .padding(EdgeInsets(top: 2, leading: 30, bottom: 30, trailing: 30))
                            .font(.system(size: 15, weight: .bold ))
                    }
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
        .onAppear{
            turtlePositionX = 414 + 200
            playSound(sound: "sea", type: "mp3")

        }
        
    }
}

struct scene2: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var i: Int = 0
    @State var turtlePositionX: CGFloat = 0
    @State var turtleImages = "turtle_mama.png"
    @State var turtleWalking = ["turtle_mama.png", "turtle_mama_walk.png"]
    
    
    @State var d: Int = 0
    var dialogues = [
        "Here. Here my eggs will be in safe.",
        "Here. Here my eggs will be in safe.",
        "Now That i found a place for you, I can leave in peace. "
    ]
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "beach_first_page.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 414)
            Image(uiImage: UIImage (named: turtleImages)!)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .offset(x: turtlePositionX, y: 100)
                .animation(.easeOut(duration: 10.0), value: turtlePositionX)
                .onReceive(timer, perform: {_ in
                    turtleImages = turtleWalking[i]
                    i = i+1
                    if i>1 {i=0}
                })
            VStack {
                Spacer()
                VStack {
                    Text("Turtle Mama:")
                        .font(.system(size: 20, weight: .bold))
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 2, trailing: 30))
                    
                    Text(dialogues[d])
                        .font(.system(size: 20, weight: .regular ))
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 2, trailing: 30))
                    
                    HStack {
                        Spacer()
                        Button("Next ›", action: {
                            d += 1
                            turtleWalking = ["turtle_mama.png", "turtle_mama_walk.png"]
                            if d > 0 {
                                PlaygroundPage.current.setLiveView(scene3())
                                
                            }
                        })
                            .padding(EdgeInsets(top: 2, leading: 30, bottom: 30, trailing: 30))
                            .font(.system(size: 15, weight: .bold ))
                    }
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
        .onAppear{
            turtlePositionX = 414 + 200}
        
    }
}


struct scene3: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var i: Int = 0
    @State var turtleImages = "turtle_mama.png"
    
    @State var d: Int = 0
    var speaker = [
    "",
    "Turtle Mama",
    ""
    ]
    var dialogues = [
        "...",
        "Now That i found a place for you, I can leave in peace. ",
        "*The story continues in the next page*"
    ]
    
    @State var hideButton: Double = 1
    
    @State var audioPlayer: AVAudioPlayer?

    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "beach_death.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 414)
            Image(uiImage: UIImage (named: turtleImages)!)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
            
            VStack {
                Spacer()
                VStack {
                    Text(speaker[d])
                        .font(.system(size: 20, weight: .bold))
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 2, trailing: 30))
                    
                    Text(dialogues[d])
                        .font(.system(size: 20, weight: .regular ))
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 2, trailing: 30))
                    HStack {
                        Spacer()
                    Button("Next ›", action: {
                        d += 1
                        if d > 1 {
                            turtleImages = "turtle_mama_dead.png"
                            hideButton = 0
                            playSound(sound: "death", type: "wav")
                            
                        }
                    })
                        .opacity(hideButton)
                        .padding(EdgeInsets(top: 2, leading: 30, bottom: 30, trailing: 30))
                        .font(.system(size: 15, weight: .bold ))
                    }
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

//: [Next](@next)
