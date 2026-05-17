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
}
