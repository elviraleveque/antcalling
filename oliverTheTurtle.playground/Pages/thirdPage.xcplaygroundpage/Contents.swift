import SwiftUI
import PlaygroundSupport
import AVFoundation

struct TurtleRun: View {
    @State var finalScale = 0.01
    @State var garbageCounter = 0
    @State var opc = 0.00
    
    @State var TopLeftScale = 1.00
    @State var TopMidScale = 1.00
    @State var TopRightScale = 1.00
    @State var MiddleLeftScale = 1.00
    @State var MiddleMidScale = 1.00
    @State var MiddleRightScale = 1.00
    @State var BottomLeftScale = 1.00
    @State var BottomRightScale = 1.00
    @State var opacityStart: Double = 1
    
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
            ZStack {
                Image(uiImage: UIImage(named:"win_game_background.png")!)
                    .resizable()
                    .scaledToFit()
                
            
                //Top-Left
                GarbageRun()
                    .offset(x:-100,y:-250)
                    .scaleEffect(TopLeftScale)
                    .animation(.linear(duration: 1), value:TopLeftScale)
                    .onTapGesture {
                        TopLeftScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)
                        playSound(sound: "bin", type: "mp3")
                        
                    }
                
                //Top-Mid
                GarbageRun()
                    .offset(x:0,y:-50)
                    .scaleEffect(TopMidScale)
                    .animation(.linear(duration: 1), value:TopMidScale)
                    .onTapGesture {
                        TopMidScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)

                        
                    }
                //Top-Right
                GarbageRun()
                    .offset(x:100,y:-200)
                    .scaleEffect(TopRightScale)
                    .animation(.linear(duration: 1), value:TopRightScale)
                    .onTapGesture {
                        TopRightScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)

                        
                    }
                //Middle-Left
                GarbageRun()
                    .offset(x:-100,y:40)
                    .scaleEffect(MiddleLeftScale)
                    .animation(.linear(duration: 1), value:MiddleLeftScale)
                    .onTapGesture {
                        MiddleLeftScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)

                        
                    }
                //Middle-Mid
                GarbageRun()
                    .offset(x:50,y:250)
                    .scaleEffect(MiddleMidScale)
                    .animation(.linear(duration: 1), value:MiddleMidScale)
                    .onTapGesture {
                        MiddleMidScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)

                        
                    }
                //Middle-Right
                GarbageRun()
                    .offset(x:150,y:100)
                    .scaleEffect(MiddleRightScale)
                    .animation(.linear(duration: 1), value:MiddleRightScale)
                    .onTapGesture {
                        MiddleRightScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)

                        
                    }
                //Bottom-Left
                GarbageRun()
                    .offset(x:-120,y:300)
                    .scaleEffect(BottomLeftScale)
                    .animation(.linear(duration: 1), value:BottomLeftScale)
                    .onTapGesture {
                        BottomLeftScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)

                        
                    }
                //Bottom-Right
                GarbageRun()
                    .offset(x:150,y:380)
                    .scaleEffect(BottomRightScale)
                    .animation(.linear(duration: 1), value:BottomRightScale)
                    .onTapGesture {
                        BottomRightScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)

                        
                    }
                VStack {
                    Text("Tap on the garbages and clean the beach!")
                        .multilineTextAlignment(.center)

                        .font(.system(size: 20, weight: .regular ))
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
                    
                    Button("Start", action: {
                        opacityStart = 0
                    })
                        .padding(EdgeInsets(top: 2, leading: 30, bottom: 30, trailing: 30))
                        .font(.system(size: 20, weight: .bold ))
                }
                .foregroundColor(.black)
                .frame(width: 395)
                .background(Color(red: 1.0, green: 0.95, blue: 0.87))
                .cornerRadius(15)
                .opacity(opacityStart)

                
            }
            Text("__Well done!__ \n Go to the next page.")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .regular ))
                .padding(30)
                .foregroundColor(.black)
                .frame(width: 395)
                .background(Color(red:1.0, green:0.95, blue:0.87 ))
                .cornerRadius(15)
                .opacity(opc)
        }
        .frame(width: 414, height: 896)
        
    }
}

func winCondition(counter:Int) -> Double{
    if counter == 8 {
        return 1
    }
    return 0
    
}

struct GarbageRun : View {
    @State var scale = 1.00
    @State public var i=Int.random(in: 0..<7)
    public var imageNames = ["Bottle.png","Can.png","CottonSwab.png","PlasticBag.png","PlasticSpoon.png","ToothPaste.png","WastePaper.png"]
    
    
    
    
    var body : some View {
        
        ZStack{
            Image(uiImage: UIImage(named: imageNames[i])!)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                
        }
    }
}

PlaygroundPage.current.setLiveView(TurtleRun())

//: [Previous](@previous)    [Next](@next)

