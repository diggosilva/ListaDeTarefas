//
//  TaskFormView.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 14/05/26.
//

import UIKit

protocol TaskFormViewDelegate: AnyObject {
    func didTapAddButton(title: String, priority: TaskPriority.RawValue)
}

final class TaskFormView: UIView {
    
    weak var delegate: TaskFormViewDelegate?
    
    lazy var prioritySegmented: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Baixa", "Média", "Alta"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Título da tarefa"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .words
        return textField
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
    
    private func setupHierarchy() {
        addSubview(prioritySegmented)
        addSubview(titleTextField)
        addSubview(addButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            prioritySegmented.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            prioritySegmented.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            prioritySegmented.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            titleTextField.topAnchor.constraint(equalTo: prioritySegmented.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: prioritySegmented.leadingAnchor),
            titleTextField.trailingAnchor.constraint(equalTo: prioritySegmented.trailingAnchor),
            
            addButton.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            addButton.leadingAnchor.constraint(equalTo: prioritySegmented.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: prioritySegmented.trailingAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupConfigurations() {
        backgroundColor = .secondarySystemBackground
    }
    
    @objc func didTapAddButton() {
        guard let text = titleTextField.text, !text.isEmpty else { return }
        let priority = prioritySegmented.selectedSegmentIndex
        delegate?.didTapAddButton(title: text, priority: priority)
    }
}
