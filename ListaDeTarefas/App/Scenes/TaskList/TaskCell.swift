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
    
    lazy var checkMarkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGreen
        return imageView
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
        checkMarkImage.image = nil
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(priorityView)
        contentView.addSubview(vStack)
        contentView.addSubview(checkMarkImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            priorityView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            priorityView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priorityView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            priorityView.widthAnchor.constraint(equalToConstant: 4),
            
            vStack.topAnchor.constraint(equalTo: priorityView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: priorityView.trailingAnchor, constant: 8),
            vStack.trailingAnchor.constraint(equalTo: checkMarkImage.leadingAnchor, constant: -16),
            vStack.bottomAnchor.constraint(equalTo: priorityView.bottomAnchor),
            
            checkMarkImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkMarkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkMarkImage.widthAnchor.constraint(equalToConstant: 24),
            checkMarkImage.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func setupConfigurations() {
        self.accessoryType = .none
        self.selectionStyle = .none
    }
    
    private func setupCell(alpha: CGFloat, priorityColor: UIColor, checkmarkAlpha: CGFloat) {
        priorityView.backgroundColor = priorityColor
        priorityView.alpha = alpha
        titleLabel.alpha = alpha
        dateLabel.alpha = alpha
        checkMarkImage.alpha = checkmarkAlpha
    }
    
    private func isCompleted(task: Tarefa) {
        if task.isCompleted {
            setupCell(alpha: 0.5, priorityColor: .systemGreen, checkmarkAlpha: 1.0)
        } else {
            setupCell(alpha: 1.0, priorityColor: task.priority.color, checkmarkAlpha: 0.0)
        }
    }
    
    func configure(task: Tarefa) {
        titleLabel.text = task.title
        dateLabel.text = task.date.dateRelative()
        isCompleted(task: task)
    }
}
