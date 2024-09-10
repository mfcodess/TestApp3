//
//  PanelCollectionViewCell.swift
//  TestApp_3
//
//  Created by Max on 09.09.2024.
//

import UIKit

class PanelCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Private properties
    
    private lazy var panelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        //label.numberOfLines = 0
        label.textColor = .black
        //label.backgroundColor = .red
        
        return label
    }()
    
    private lazy var bottomLine: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.lineColorr
        
           return view
    }()
    
    private lazy var viewLabel: UIView = {
        let view = UIView()
        //view.backgroundColor = .green
        view.addSubview(panelLabel)
        view.addSubview(bottomLine)
        
        return view
    }()
    
    
    // MARK: - Override method
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(viewLabel)
        createViewLabelConstrains()
        createPanelLabelConstraints()
        createBottomLineConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func configure(text: String) {
        panelLabel.text = text
    }
    func configureTextColor(textColor: UIColor) {
        panelLabel.textColor = textColor
    }
    
    func configureBottomLine(isSelected: Bool) {
        bottomLine.isHidden = !isSelected
    }
    
    // MARK: - Private methods
    
    private func createViewLabelConstrains() {
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func createPanelLabelConstraints() {
        panelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            panelLabel.leadingAnchor.constraint(equalTo: viewLabel.leadingAnchor, constant: 8),
            panelLabel.trailingAnchor.constraint(equalTo: viewLabel.trailingAnchor, constant: -8),
            panelLabel.topAnchor.constraint(equalTo: viewLabel.topAnchor, constant: 8),
            panelLabel.bottomAnchor.constraint(equalTo: viewLabel.bottomAnchor, constant: -8)
        ])
    }
    
    private func createBottomLineConstrains() {
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLine.trailingAnchor.constraint(equalTo: viewLabel.trailingAnchor),
            bottomLine.leadingAnchor.constraint(equalTo: viewLabel.leadingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: viewLabel.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 2.0)
        ])
    }
}

#Preview {
    PanelCollectionViewCell()
}
