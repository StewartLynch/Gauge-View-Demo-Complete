//
// Created for GaugeView Demo
// by Stewart Lynch on 2022-09-30
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct Circular: View {
    @State private var value = 0.0
    private var minimum = -10.0
    private var maximum = 10.0
    var body: some View {
        NavigationStack {
            Form {
                Section("AccessoryCircular") {
                    Text("This style displays the gauge’s currentValueLabel value at the center of the gauge. If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear in the opening at the bottom of the ring. Otherwise, the gauge places its label in that location.")
                        .font(.caption)
                    Gauge(value: value, in: minimum...maximum) {
                        Text("Rating").foregroundColor(.purple)
                            .scaleEffect(0.75)
                    } currentValueLabel: {
                        Text("\(Int(value))").foregroundColor(.purple)
                    }
                    .gaugeStyle(.accessoryCircular)
                    .scaleEffect(1.5)
                    .padding()
                    .tint(.teal)
                    Gauge(value: value, in: minimum...maximum) {
                        
                    } currentValueLabel: {
                        Text("\(Int(value))").foregroundColor(.purple)
                    } minimumValueLabel: {
                        Text("\(Int(minimum))").foregroundColor(.purple)
                    } maximumValueLabel: {
                        Text("\(Int(maximum))").foregroundColor(.purple)
                    }
                    .gaugeStyle(.accessoryCircular)
                    .scaleEffect(1.5)
                    .padding()
                    .tint(.teal)
                }
                Section("AccessoryCircularCapacity") {
                    Text("This style displays the gauge’s currentValueLabel value at the center of the gauge.")
                        .font(.caption)
                    Gauge(value: value, in: minimum...maximum) {
                       
                    } currentValueLabel: {
                        Text("\(Int(value))").foregroundColor(.red)
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .scaleEffect(1.5)
                    .padding()
                    .tint(.red)
                }
            }
            Spacer()
            Slider(value: $value, in: minimum...maximum)
                .padding()
                .navigationTitle("Circular Gauges")
        }
    }
}

struct Circular_Previews: PreviewProvider {
    static var previews: some View {
        Circular()
    }
}
