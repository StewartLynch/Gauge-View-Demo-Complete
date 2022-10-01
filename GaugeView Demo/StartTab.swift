//
// Created for GaugeView Demo
// by Stewart Lynch on 2022-09-30
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView {
            Linear()
                .tabItem {
                    Label("Linear Gauges", systemImage: "1.circle.fill")
                }
            Circular()
                .tabItem {
                    Label("Circular Gauges", systemImage: "2.circle.fill")
                }
            BlastOff()
                .tabItem {
                    Label("BlastOff", systemImage: "3.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartTab()
    }
}
