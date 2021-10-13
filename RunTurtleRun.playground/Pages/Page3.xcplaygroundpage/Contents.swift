import SwiftUI
import PlaygroundSupport

struct TurtleRun: View {
    @State var offsetX=0
    @State var offsetY:CGFloat = -430
    @State var offset_Y_mid:CGFloat = -380
    @State var scale = 1.00
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named:"base.PNG")!)                .resizable()
                .scaledToFit()
            
            HStack(alignment:.top){
                Text("TurtleRun")
                    .offset(x:0,y:-430)
                    .onTapGesture {
//                        offset_Y_mid=380
                        if offset_Y_mid != 380 {
                            <#code#>
                        }
                        
                    }
            }
            Image(uiImage: UIImage(named:"Can.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .offset(x:0,y:offset_Y_mid)
                .animation(.linear(duration: 10), value: offset_Y_mid)
                .scaleEffect(scale)
                .animation(
                    .easeIn(duration:0.5),
                    value:scale)
                .onTapGesture {
                    scale=0.01
                }
        }
        .frame(width: 414, height: 896)
    }
}

PlaygroundPage.current.setLiveView(TurtleRun())


