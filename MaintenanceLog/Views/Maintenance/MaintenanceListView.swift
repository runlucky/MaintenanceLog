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

// メモ
//
//・給油
//    燃費、走行距離、給油量、給油単価
//    給油場所: スタンド名、スタンドのブランド
//    油種 レギュラー/ガソリン
//    給油方法: セルフ/フルサービス
//    オプション: 水抜き剤、ガソリン添加剤など
//
//・オイル交換
//    油種 エンジンオイル・ミッションオイル・デフオイル
//    オイルメーカ、交換量
//    
//    
//・タイヤ交換
//・フィルター交換
//・洗車
//
//・点検
//    空気圧、オイル量、ワイパー、バッテリー、ブレーキパッド、
//    ブレーキオイル、ベルト、ホース、ボルト類の増し締め
//    
//・修理
//    修理箇所、修理内容、修理費用、修理者
//・事故
//・保険
//    車検
//    自賠責
//    任意保険
//・税金
//    自動車税
//    重量税
//・予定
//    次回点検日
//    車検
//    エンジンオイルなどの交換時期(半年または1年後、など)
//    
//・ドライブ記録
//    ツーリングや走行会など
//    
//・部品購入
//    ライトやオイルなどの消耗品、交換品
//    
//・車両基礎情報
//    車種、型式など
//    保管場所
//    
//・違反記録
//    点数、違反内容
//    
