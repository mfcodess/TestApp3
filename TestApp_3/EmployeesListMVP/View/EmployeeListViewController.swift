//
//  EmployeeListViewController.swift
//  TestApp_3
//
//  Created by Max on 08.09.2024.
//

import UIKit

final class EmployeeListViewController: UIViewController {
    

    //MARK: - Private properties
    
    private lazy var textField: UITextField = {
        let attrubtedString = NSMutableAttributedString(string: "Введи ім'я, тег, пошту...")
        attrubtedString.setTextColor(color: .textFieldPlaceholderTextColorr, toSubstring: "Введи ім'я, тег, пошту...")
        
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .black
        textField.backgroundColor = .textFieldColorr
        textField.layer.cornerRadius = 15
        textField.font = .systemFont(ofSize: 14, weight: .medium)
        textField.attributedPlaceholder = attrubtedString
        
        ///Create Button Left
        let buttonLeft = UIButton(type: .custom)
        buttonLeft.setImage(UIImage(named: "textFieldSearch"), for: .normal)
        buttonLeft.frame = CGRect(x: 12, y: -1, width: 24, height: 24)
        //button.backgroundColor = .green
        buttonLeft.tintColor = .red
        
        ///Create View Left
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: 20))
        leftViewContainer.addSubview(buttonLeft)
        //leftViewContainer.backgroundColor = .red
        
        textField.leftView = leftViewContainer
        textField.leftViewMode = .always
        
        ///Create Button Right
        let buttonRight = UIButton(type: .custom)
        buttonRight.setImage(UIImage(named: "textFieldSearchList"), for: .normal)
        buttonRight.frame = CGRect(x: 0, y: -1, width: 24, height: 24)
        //buttonRight.backgroundColor = .green
        buttonRight.tintColor = .red
        
        ///Create View Right
        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 20))
        rightViewContainer.addSubview(buttonRight)
        //rightViewContainer.backgroundColor = .red
        
        textField.rightView = rightViewContainer
        textField.rightViewMode = .always
        
        return textField
    }()
    private var panelElement = ["Всi", "iOS", "Android", "Дизайн", "Управління", "QA", "HR", "Backend", "Техпідтримка", "Аналітика"]
    private var selectedIndexPath: IndexPath?
    
    private lazy var panelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.backgroundColor = .purple
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PanelCollectionViewCell.self, forCellWithReuseIdentifier: "PanelCollectionViewCell")
        
        return collectionView
    }()
    
    // MARK: - Override method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        ///Add to the Screen TextField
        view.addSubview(textField)
        createTextFieldConstrains()
        
        ///Add to the Screen Panel
        view.addSubview(panelCollectionView)
        createPanelCollectionViewConstrains()
    }
}

//MARK: - Extension

extension EmployeeListViewController {
    
    // MARK: - Private methods
    private func createTextFieldConstrains() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func createPanelCollectionViewConstrains() {
        panelCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            panelCollectionView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            panelCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            panelCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            panelCollectionView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension EmployeeListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return panelElement.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PanelCollectionViewCell", for: indexPath) as! PanelCollectionViewCell
        
        cell.configure(text: panelElement[indexPath.row])
        
        switch indexPath.row {
        case 0:
            cell.configureTextColor(textColor: .black)
            cell.configureBottomLine(isSelected: true)
        case 1:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 2:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 3:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 4:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 5:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 6:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 7:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 8:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        case 9:
            cell.configureTextColor(textColor: .gray)
            cell.configureBottomLine(isSelected: false)
        default:
            cell.configureBottomLine(isSelected: false)
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension EmployeeListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let previousIndexPath = selectedIndexPath,
           let previousCell = collectionView.cellForItem(at: previousIndexPath) as? PanelCollectionViewCell {
            previousCell.configureTextColor(textColor: .gray)
            previousCell.configureBottomLine(isSelected: false)
        }
        
        selectedIndexPath = indexPath
        if let cell = collectionView.cellForItem(at: indexPath) as? PanelCollectionViewCell {
            cell.configureTextColor(textColor: .black)
            cell.configureBottomLine(isSelected: true)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension EmployeeListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Получаем текст для текущей ячейки из массива panelElement
        let text = panelElement[indexPath.row]
        
        // Задаем максимальную ширину ячейки (например, 160)
        let maxWidth = CGFloat(150)
        
        // Рассчитываем ширину текста, используя стандартный шрифт
        let textWidth = (text as NSString).size(withAttributes: nil).width
        
        // Добавляем отступы и проверяем, чтобы ширина не была меньше 10 пунктов и не превышала максимальную ширину
        let cellWidth = min(max(textWidth + 39, 0), maxWidth) // +50 для отступов (20 слева и 20 справа)
        
        // Возвращаем рассчитанный размер, чтобы ячейка могла динамически подстраиваться под текст
        return CGSize(width: cellWidth, height: collectionView.bounds.height)

    }
}




#Preview {
    EmployeeListViewController()
}
