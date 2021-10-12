import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var scale = 0.75
    @State var rotation = false
    @State var images = "1.jpg"
    @State var i: Int = 0
    @State var onTop = true
    @State var number: CGFloat = 0
    var imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg"]
    var body: some View {
        VStack {
            Text("This is an alien invasion!")
                .padding()
            Button{
                print("Alien Invasion UAHHHH")
                scale=0.01
            }
        label:{
            Text("Approach")
                .padding(10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            
            
        }
        .padding()
            
            
            HStack{
                
                   Image(uiImage: UIImage(named:"TurtleFlat.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
                    .animation(.linear(duration: 2),value:scale )
                    .offset(y:number)
                    .onTapGesture {
                        number=300                   }
                
               /* Image(uiImage: UIImage (named: images)!)
                    .onReceive(timer, perform: {_ in
                        images=imageNames[i]
                        i=i+1
                        if i>=9 {i=0}
                    }) */
                
                /*Image(uiImage: UIImage (named: "ufo.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame( width:75, height: 75)
                    .aspectRatio(contentMode: .fit)
                    .border(.blue)
                    .scaleEffect(scale)
                    .animation(
                        .linear(duration:2),
                        value:scale)
                    .padding()
                    .offset(x:25)*/
                Spacer()
            }
            Spacer()
            Image(uiImage: UIImage (named: "planet-earth.png")!)
                .resizable()
                .scaledToFit()
                .frame( width:300, height: 300)
                .border(.red)
                .padding()
            //.renderingMode(.original)
                .onTapGesture {
                    print("AO SE MOVE")
                    rotation=true
                }
                .rotationEffect(rotation ? .zero : Angle.degrees(360))
                .animation(
                    .linear(duration: 100)
                        .repeatForever(autoreverses:false),
                    value: rotation)
        }
        .frame(width:400, height:600)
    }
    
}



PlaygroundPage.current.setLiveView(ContentView())
