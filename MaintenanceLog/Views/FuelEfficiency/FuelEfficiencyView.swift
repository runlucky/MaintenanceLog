import Foundation
import SwiftUI

internal struct FuelEfficiencyView: View {
    let source: FuelEfficiency
    
    var body: some View {
        HStack(spacing: 0) {
            Text(source.timestamp.toString(.current, format: "d") + "日")
            Spacer()
            fuelEfficiency
            Spacer()
            fuel
            Spacer()
            trip
            Spacer()
            odo
        }
//        .frame(height: 60)
//        .border(Color.red)
    }
    
    private var fuelEfficiency: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text(source.fuelEfficiency.toString(scale: 2))
                .font(.title2)
                .bold()
            Text("km/L")
                .font(.footnote)
                .opacity(0.5)
                .padding(.bottom, 2)
        }
    }

    private var fuel: some View {
        VStack(alignment: .leading) {
            Text("給油")
                .font(.subheadline)
                .opacity(0.5)
            HStack(alignment: .bottom, spacing: 0) {
                Text(source.fuel.description)
                    .bold()
                Text("L")
                    .font(.footnote)
                    .opacity(0.5)
            }
        }
    }

    private var trip: some View {
        VStack(alignment: .leading) {
            Text("trip")
                .font(.subheadline)
                .opacity(0.5)
            HStack(alignment: .bottom, spacing: 0) {
                Text(source.tripmeter.description)
                    .bold()
                Text("km")
                    .font(.footnote)
                    .opacity(0.5)
            }
        }
    }
    
    private var odo: some View {
        VStack(alignment: .leading) {
            Text("odo")
                .font(.subheadline)
                .opacity(0.5)
            HStack(alignment: .bottom, spacing: 0) {
                Text(source.odometer.description)
                    .bold()
                Text("km")
                    .font(.footnote)
                    .opacity(0.5)
            }
        }
    }

}

struct FuelEfficiencyView_Previews: PreviewProvider {
    static var previews: some View {
        FuelEfficiencyView(source: FuelEfficiency(timestamp: Date(), odometer: 1000, tripmeter: 10, fuel: 2, memo: "a"))
    }
}


extension Double {
    public func toString(scale: Int) -> String {
        String(format: "%.\(scale)f", self)
    }
}

extension Date {
    public func toString(_ timeZone: TimeZone, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = timeZone

        return formatter.string(from: self)
    }
}
