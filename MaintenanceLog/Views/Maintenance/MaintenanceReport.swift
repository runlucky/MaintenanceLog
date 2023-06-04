import Foundation

struct MaintenanceReport: Codable {
    let timestamp: Date
    let title: String
    let memo: String?
    let odometer: Int?
    let image: URL?
}

extension MaintenanceReport: Identifiable {
    var id: String { timestamp.description + title}
}
