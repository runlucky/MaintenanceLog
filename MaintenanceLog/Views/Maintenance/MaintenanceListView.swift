//
//  MaintenanceListView.swift
//  MaintenanceLog
//
//  Created by Kakeru Fukuda on 2023/06/03.
//

import SwiftUI

struct MaintenanceListView: View {
    @State var items: [MaintenanceReport]
    let storage: IStorage
    
    init(_ storage: IStorage) {
        self.storage = storage
        self._items = State(initialValue: (try? storage.get(key: "MaintenanceListView", type: [MaintenanceReport].self)) ?? [])
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(items) { item in
                    MaintenanceView(source: item)
                }
                .onDelete { index in
                    self.items.remove(atOffsets: index)
                }
            }
            
            AddButton {
                let item = MaintenanceReport(timestamp: Date(),
                                             title: "title" + items.count.description,
                                             memo: "memo..." + items.count.description,
                                             odometer: 1000 + items.count,
                                             image: nil)
                
                items.append(item)
                try? storage.upsert(key: "MaintenanceListView", value: items)
            }
            .padding(10)
        }
    }
}

struct MaintenanceListView_Previews: PreviewProvider {
    static var previews: some View {
        MaintenanceListView(container.resolve(IStorage.self))
    }
}
