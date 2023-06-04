import Foundation
import SwiftUI

internal struct FuelEfficiencyListView: View {
    @State var items: [FuelEfficiency]
    let storage: IStorage
    
    init(_ storage: IStorage) {
        self.storage = storage
        self._items = State(initialValue: (try? storage.get(key: "FuelEfficiencyList", type: [FuelEfficiency].self)) ?? [])
    }
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(items) { item in
                    FuelEfficiencyView(source: item)
                }
            }

            AddButton {
                let item = FuelEfficiency(timestamp: Date(),
                                          odometer: 10000 + items.count,
                                          tripmeter: 100 + items.count,
                                          fuel: 5,
                                          memo: "aaa")
                
                items.append(item)
                try? storage.upsert(key: "FuelEfficiencyList", value: items)
            }
            .padding(10)
        }
    }
}

struct FuelEfficiencyListView_Previews: PreviewProvider {
    static var previews: some View {
        FuelEfficiencyListView(UserDefaultsStorage(.standard, bundleIdentifier: Bundle.main.bundleIdentifier!))
    }
}

