import Foundation
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            FuelEfficiencyListView(UserDefaultsStorage(.standard, bundleIdentifier: Bundle.main.bundleIdentifier!))
                .tabItem {
                    Label("燃費", systemImage: "fuelpump.fill")
                }
            Text("b")
                .tabItem {
                    Label("整備記録", systemImage: "wrench.adjustable.fill")
                }
            Text("a")
                .tabItem {
                    Label("車体情報", systemImage: "car")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}



struct Log: Codable {
    let timestamp: Date
    let group: LogGroup
    let text: String
}

protocol ILog {
    var timestamp: Date { get }
    var text: String { get }
}


struct MaintenanceReport: Codable {
    let timestamp: Date
    let odometer: Double?
    let memo: String
    let image: URL?
}



enum LogGroup: Codable {
    /// 給油
    case fuelEfficiency
    /// エンジンオイル交換
    case oil
    /// 洗車
    case wash
    /// ブレーキ/クラッチ/チェーン調整
    /// パーツ交換
    /// 不具合(異音、違和感、パーツ破損、)
    case maintenance
    case other
}
