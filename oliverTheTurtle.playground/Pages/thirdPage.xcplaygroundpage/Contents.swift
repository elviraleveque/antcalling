import SwiftUI
import PlaygroundSupport

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
    
    
    
    
    var body: some View {
        ZStack {
            ZStack {
                Image(uiImage: UIImage(named:"win_game_background.png")!)
                    .resizable()
                    .scaledToFit()
                
                
//                HStack(alignment:.top){
//                    Text("Clean the beach!")
//                        .font(.title)
//                        .bold()
//                        .padding(15)
//                        .foregroundColor(.white)
////                        .background(Color(red:1.0, green:1.0, blue:1.0 ))
//                        .cornerRadius(15)
//                        .offset(x:0,y:-390)
//
//
//
//                }
                //Top-Left
                GarbageRun()
                    .offset(x:-100,y:-250)
                    .scaleEffect(TopLeftScale)
                    .animation(.linear(duration: 1), value:TopLeftScale)
                    .onTapGesture {
                        TopLeftScale=finalScale
                        garbageCounter+=1
                        opc=winCondition(counter: garbageCounter)
                        
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
                    Text("Tap on the garbage and clean the beach!")
                        .padding(30)
                    
                    Button("Start", action: {
                        opacityStart = 0
                    }
                    )
                        .padding(.bottom, 30)
                }
                .foregroundColor(.black)
                .frame(width: 395)
                .background(Color(red: 1.0, green: 0.95, blue: 0.87))
                .cornerRadius(15)
                .opacity(opacityStart)

                
            }

            Text("Well done! Go to the next page.")
                .offset(x:0,y:0)
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

