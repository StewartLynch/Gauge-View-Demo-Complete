//
// Created for GuageView Demo
// by Stewart Lynch on 2022-09-30
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct Linear: View {
    @State private var value = 20.0
    private var minimum = 0.0
    private var maximum = 100.0
    var body: some View {
        NavigationStack {
            Form {
                Section("Linear Capacity") {
                    Text("If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear on leading and trailing edges of the bar, respectively. The label appears above the gauge, and the currentValueLabel appears below.")
                        .font(.caption)
                    Gauge(value: 0.2) {
                        Text("Rating")
                    }
                    .tint(.red)
                    Gauge(value: value, in: minimum...maximum) {
                        Text("Rating")
                    } currentValueLabel: {
                        Text("\(Int(value))")
                    } minimumValueLabel: {
                        Text("\(Int(minimum))")
                    } maximumValueLabel: {
                        Text("\(Int(maximum))")
                    }
                    .tint(ImagePaint(image: Image("star")))
                    .gaugeStyle(.linearCapacity)
                }
                Section("AccessoryLinear") {
                    Text("If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear on leading and trailing edges of the bar, respectively. Otherwise, the gauge displays the currentValueLabel value on the leading edge.")
                        .font(.caption)
                    Gauge(value: value, in: minimum...maximum) {
                        
                    } currentValueLabel: {
                        Text("\(Int(value))")
                    } minimumValueLabel: {
                        Text("\(Int(minimum))")
                    } maximumValueLabel: {
                        Text("\(Int(maximum))")
                    }
                    .tint(Gradient(colors: [.blue, .green, .yellow, .orange, .red]))
                    .gaugeStyle(.accessoryLinear)
                }
                Section("AccessoryLinearCapacity") {
                    Text("If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear on leading and trailing edges of the bar, respectively. The label appears above the gauge, and the currentValueLabel appears below.")
                        .font(.caption)
                    Gauge(value: value, in: minimum...maximum) {
                        Text("Temperature")
                    } currentValueLabel: {
                        Text("\(Int(value))")
                    } minimumValueLabel: {
                        Text("\(Int(minimum))")
                    } maximumValueLabel: {
                        Text("\(Int(maximum))")
                    }
                    .tint(.red)
                    .gaugeStyle(.accessoryLinearCapacity)
                }
            }
            Spacer()
            Slider(value: $value, in: minimum...maximum)
                .padding()
                .navigationTitle("Linear Gauges")
        }
    }
}

struct Linear_Previews: PreviewProvider {
    static var previews: some View {
        Linear()
    }
}
