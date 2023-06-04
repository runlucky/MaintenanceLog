import Foundation
import SwiftUI

struct RootView: View {
    let storage = UserDefaultsStorage(.standard, bundleIdentifier: Bundle.main.bundleIdentifier!)
    
    var body: some View {
        TabView {
            FuelEfficiencyListView(storage)
                .tabItem {
                    Label("燃費", systemImage: "fuelpump.fill")
                }
            MaintenanceListView(storage)
                .tabItem {
                    Label("整備記録", systemImage: "wrench.adjustable.fill")
                }
            SpecListView()
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
