//
//  MaintenanceView.swift
//  MaintenanceLog
//
//  Created by Kakeru Fukuda on 2023/06/03.
//

import SwiftUI

struct MaintenanceView: View {
    let source: MaintenanceReport
    
    var body: some View {
        HStack(spacing: 0) {
            Text(source.timestamp.toString(.current, format: "d") + "日")
            
            VStack {
                HStack {
                    Text(source.title)
                    odo
                }
                Text(source.memo ?? "")
            }

        }
        
    }

    @ViewBuilder
    private var odo: some View {
        if let odometer = source.odometer {
            VStack(alignment: .leading) {
                Text("odo")
                    .font(.subheadline)
                    .opacity(0.5)
                HStack(alignment: .bottom, spacing: 0) {
                    Text(odometer.description)
                        .bold()
                    Text("km")
                        .font(.footnote)
                        .opacity(0.5)
                }
            }
        } else {
            EmptyView()
        }
        
    }
}

struct MaintenanceView_Previews: PreviewProvider {
    static var previews: some View {
        MaintenanceView(source: MaintenanceReport(timestamp: Date(), title: "title", memo: "memo...", odometer: 100, image: nil))
    }
}
