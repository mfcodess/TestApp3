//
//  CustomTableViewCell.swift
//  TestApp_3
//
//  Created by Max on 12.09.2024.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    //MARK: - Private properties
    
    private lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Max")
        image.layer.cornerRadius = 36
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Максим Федосєєнко"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var userCategoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var userNameAndCategoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = -30
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(userCategoriesLabel)
        return stackView
    }()
    
    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(userImageView)
        stackView.addArrangedSubview(userNameAndCategoriesStackView)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userInfoStackView)
        createUserInfoStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUserInfoStackViewConstraints() {
        NSLayoutConstraint.activate([
            userInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            userInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            userImageView.heightAnchor.constraint(equalToConstant: 72),
            userImageView.widthAnchor.constraint(equalToConstant: 72)
        ])
    }
}

#Preview {
    CustomTableViewCell()
}
