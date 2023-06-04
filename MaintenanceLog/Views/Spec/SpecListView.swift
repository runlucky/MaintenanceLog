//
//  SpecListView.swift
//  MaintenanceLog
//
//  Created by Kakeru Fukuda on 2023/06/03.
//

import SwiftUI

struct SpecListView: View {
    let items = [
        "基本情報 (車体名や公式リンクなど",
        "整備情報(指定オイルや粘度、レバー類の遊びやチェーンのたるみ、許容タイヤサイズなど)",
        "現状(カスタム内容や今履いているタイヤ情報など",
        "---",
        "車体名",
        "型番",
        "エンジン型番",
        "カラーコード",
        "年式",
        "タイヤ(前後、サイズ、空気圧、リム幅...)",
        "エンジン ドレンワッシャー サイズ",
        "チェーン(メンテナンスのやりかた、たるみ許容範囲",
        "",
    ]
    
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    }
}


struct SpecListView_Previews: PreviewProvider {
    static var previews: some View {
        SpecListView()
    }
}
