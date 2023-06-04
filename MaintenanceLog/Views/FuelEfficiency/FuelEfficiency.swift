import Foundation

struct FuelEfficiency: Codable {
    let timestamp: Date
    let odometer: Int
    let tripmeter: Int
    let fuel: Double
    var fuelEfficiency: Double {
        Double(tripmeter) / fuel
    }
    let memo: String
}

extension FuelEfficiency: Identifiable {
    var id: String { timestamp.description + odometer.description }
}
