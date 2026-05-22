//
//  Date+Extensions.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 17/05/26.
//

import Foundation

extension Date {
    func dateRelative() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "dd/MM/yyyy - HH:mm:ss"
        return formatter.string(from: self)
    }
}
