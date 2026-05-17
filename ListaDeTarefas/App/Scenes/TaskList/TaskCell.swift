//
//  TaskCell.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 15/05/26.
//

import UIKit

final class TaskCell: UITableViewCell {
    
    static let identifier: String = "TaskCell"
    
    lazy var priorityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .secondaryLabel
        return label
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, dateLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        priorityView.backgroundColor = nil
        titleLabel.text = nil
        dateLabel.text = nil
        self.accessoryType = .none
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
        self.accessoryType = .none
    }
    
    private func setupHierarchy() {
        addSubview(priorityView)
        addSubview(vStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            priorityView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            priorityView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priorityView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            priorityView.widthAnchor.constraint(equalToConstant: 4),
            
            vStack.topAnchor.constraint(equalTo: priorityView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: priorityView.trailingAnchor, constant: 8),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            vStack.bottomAnchor.constraint(equalTo: priorityView.bottomAnchor),
        ])
    }
    
    private func setupConfigurations() {
        
    }
    
    func configure(task: Tarefa) {
        priorityView.backgroundColor = task.priority.color
        titleLabel.text = task.title
        dateLabel.text = task.date.dateRelative()
        
        setupCell(with: task)
    }
    
    private func setupCell(with task: Tarefa) {
        if task.isCompleted {
            priorityView.backgroundColor = .systemGreen
            priorityView.alpha = 0.5
            titleLabel.alpha = 0.5
            dateLabel.alpha = 0.5
            self.accessoryType = .checkmark
        } else {
            priorityView.backgroundColor = task.priority.color
            priorityView.alpha = 1
            titleLabel.alpha = 1
            dateLabel.alpha = 1
            self.accessoryType = .none
        }
    }
}
