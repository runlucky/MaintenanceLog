//
//  AddButton.swift
//  MaintenanceLog
//
//  Created by Kakeru Fukuda on 2023/06/03.
//

import SwiftUI

struct AddButton: View {
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    
    var body: some View {
        Button(action: action ) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton() {}
    }
}
