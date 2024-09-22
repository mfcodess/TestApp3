//
//  UserProfile.swift
//  TestApp_3
//
//  Created by Max on 21.09.2024.
//

import UIKit

class UserProfile: UIViewController {
    
    //MARK: - Private properties
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25)
        ])
        return button
    }()
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Maxim Fedoseenko"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    private lazy var userCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 0
        
        return label
    }()
    
    //Date of Birth, Years Old
    
    private lazy var starsImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Star")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30),
            
        ])
        
        return image
    }()
    private lazy var dateOfBirthLabel: UILabel = {
       let label = UILabel()
        label.text = "5 june 1996"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    private lazy var textYearsOldLabel: UILabel = {
        let label = UILabel()
        label.text = "24 года"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    
    
    //Number
    
    private lazy var numberImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Phone")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 29),
            image.widthAnchor.constraint(equalToConstant: 29),
            
        ])
        
        return image
    }()
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "+380 63 459 0877"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    //StackViews
    
    private lazy var userNameAndCategoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        //stackView.backgroundColor = .red
        
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(userCategoryLabel)
        
        return stackView
    }()
    private lazy var userMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //stackView.backgroundColor = .green
        
        stackView.addArrangedSubview(userImageView)
        stackView.addArrangedSubview(userNameAndCategoryStackView)
        
        return stackView
    }()
    private lazy var starsAndDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10  // Нормальный отступ между звездой и датой рождения
        stackView.alignment = .center  // Центрирование по вертикали
        
        stackView.addArrangedSubview(starsImageView)
        stackView.addArrangedSubview(dateOfBirthLabel)
        
        return stackView
    }()

    private lazy var starsAndDataAndYearsOldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10  // Отступы между элементами
        stackView.alignment = .center  // Центрируем все элементы
        
        stackView.addArrangedSubview(starsAndDataStackView)
        
        // Пустой виджет для заполнения пространства
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stackView.addArrangedSubview(spacer)
        
        // Текст с возрастом
        stackView.addArrangedSubview(textYearsOldLabel)
        textYearsOldLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        return stackView
    }()

    private lazy var numberStackView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .horizontal
           stackView.alignment = .center  // Центрируем элементы по вертикали
           stackView.spacing = -132  // Задаем положительное значение для отступа между иконкой и текстом
           stackView.backgroundColor = .clear  // Оставляем без фона
           
           stackView.addArrangedSubview(numberImageView)
           stackView.addArrangedSubview(numberLabel)
           
           return stackView
       }()

       private lazy var mainStarsAndDataAndYearsOldStackView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .vertical
           stackView.alignment = .center  // Центрируем все по центру
           //stackView.spacing = 20  // Задаем стандартное расстояние между секциями
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.backgroundColor = .clear  // Убираем фон
           
           stackView.addArrangedSubview(starsAndDataAndYearsOldStackView)
           stackView.addArrangedSubview(numberStackView)
           
           return stackView
       }()

  
    
    // MARK: - Override method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        view.addSubview(userMainStackView)
        createUserStackConstraints()
        
        view.addSubview(mainStarsAndDataAndYearsOldStackView)
        createMainUserNameAndCategoryStackConstraints()
    }
    
    //MARK: - @Objc
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

//MARK: - Extension

extension UserProfile {
    private func createUserStackConstraints() {
        NSLayoutConstraint.activate([
            
            userMainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userMainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Размеры для изображения
            userImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // Ограничения для стека с именем и категорией
            userNameAndCategoryStackView.trailingAnchor.constraint(equalTo: userMainStackView.trailingAnchor, constant: -20),
            userNameAndCategoryStackView.leadingAnchor.constraint(equalTo: userMainStackView.leadingAnchor, constant: 20),
        ])
    }
    
    private func createMainUserNameAndCategoryStackConstraints() {
        NSLayoutConstraint.activate([
            mainStarsAndDataAndYearsOldStackView.topAnchor.constraint(equalTo: userMainStackView.bottomAnchor, constant: 10),
            mainStarsAndDataAndYearsOldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStarsAndDataAndYearsOldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            mainStarsAndDataAndYearsOldStackView.heightAnchor.constraint(equalToConstant: 100),
            
           //starsAndDataAndYearsOldStackView.topAnchor.constraint(equalTo: mainStarsAndDataAndYearsOldStackView.topAnchor),
            
            starsAndDataAndYearsOldStackView.trailingAnchor.constraint(equalTo: mainStarsAndDataAndYearsOldStackView.trailingAnchor, constant: -16),
            starsAndDataAndYearsOldStackView.leadingAnchor.constraint(equalTo: mainStarsAndDataAndYearsOldStackView.leadingAnchor, constant: 16),
            starsAndDataAndYearsOldStackView.heightAnchor.constraint(equalToConstant: 30),
            
            numberStackView.trailingAnchor.constraint(equalTo: mainStarsAndDataAndYearsOldStackView.trailingAnchor, constant: -16),
            numberStackView.leadingAnchor.constraint(equalTo: mainStarsAndDataAndYearsOldStackView.leadingAnchor, constant: 16),
            numberStackView.heightAnchor.constraint(equalToConstant: 30),
    
        
            
            
        ])
    }
}
#Preview {
    UserProfile()
}
