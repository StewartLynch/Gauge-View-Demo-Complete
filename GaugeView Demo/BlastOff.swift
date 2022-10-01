//
// Created for GaugeView Demo
// by Stewart Lynch on 2022-09-30
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct BlastOff: View {
    @State private var countdown = 10.0
    private var minimum = 0.0
    private var maximum = 10.0
    @State private var start = false
    @State private var rocketOffSet = RocketPlacement.start
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationStack{
            Text("Mission Control").font(.largeTitle)
            VStack(spacing: 30) {
                Gauge(value: countdown, in: minimum...maximum) {
                    Text(countdown > 0 ? "Count Down" : "Blast Off")
                        .scaleEffect(0.75)
                } currentValueLabel: {
                    Text("\(Int(countdown))")
                }
                .gaugeStyle(.accessoryCircular)
                .scaleEffect(2.0)
                .tint(Gradient(colors: [.red.opacity(0.4), .red]))
                .padding(.top)
                Button(countdown == 10 ? "Launch" : "Reset") {
                    if countdown == 10 {
                        start = true
                    } else {
                        start = false
                        countdown = 10.0
                        rocketOffSet = RocketPlacement.start
                    }
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                Image("rocket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .offset(x: rocketOffSet.x, y: rocketOffSet.y)
            }
            .onReceive(timer, perform: { _ in
                if countdown > 0 && start {
                    withAnimation {
                        countdown -= 1
                    }
                } else if countdown == 0 && start {
                    withAnimation(.easeIn(duration: 2.0)) {
                        rocketOffSet = RocketPlacement.end
                    }
                    start = false
                }
            })
            .navigationTitle("Blast Off")
        }
    }
}

struct BlastOff_Previews: PreviewProvider {
    static var previews: some View {
        BlastOff()
    }
}


enum  RocketPlacement {
    static let start: (x: CGFloat, y: CGFloat) = (
        x:  -UIScreen.main.bounds.size.width / 2 + 5,
        y: 0
    )
    static let end: (x: CGFloat, y: CGFloat) = (
        x: UIScreen.main.bounds.size.width + 100,
        y: -UIScreen.main.bounds.size.height - 500
    )
}
