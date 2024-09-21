//
//  EmployeeListViewController.swift
//  TestApp_3
//
//  Created by Max on 08.09.2024.
//

import UIKit

final class UserListViewController: UIViewController {
    
    private var presenter: UserListPresenterProtocol?
    
    //MARK: - Private properties
    
    private lazy var textField: UITextField = {
        let attrubtedString = NSMutableAttributedString(string: "Enter name, tag, email...")
        attrubtedString.setTextColor(color: .textFieldPlaceholderTextColorr, toSubstring: "Enter name, tag, email...")
        
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
        buttonRight.addTarget(self, action: #selector(tapTextFieldButtonRight), for: .touchUpInside)
        
        ///Create View Right
        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 20))
        rightViewContainer.addSubview(buttonRight)
        //rightViewContainer.backgroundColor = .red
        
        textField.rightView = rightViewContainer
        textField.rightViewMode = .always
        
        return textField
    }()
    
    
    
    ///Я создал переменную чтобы хранить выбранный индекс, чтобы в дальнейщем изменять состояние ячейки
    private var selectedIndex = 0
    
    private lazy var panelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.backgroundColor = .purple
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var bottomLineCollectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // MARK: - Override method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Add Background Color
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        ///Add to the Screen TextField
        view.addSubview(textField)
        createTextFieldConstrains()
        
        ///Add to the Screen Panel
        view.addSubview(panelCollectionView)
        createPanelCollectionViewConstrains()
        
        ///Add to the TableVIew
        view.addSubview(tableView)
        createTableViewConsrains()
        
        ///Add to the Bottom Line
        view.addSubview(bottomLineCollectionView)
        createBottomLineCollectionViewConstrains()
        
        
        presenter = UserListViewPresenter()
        presenter?.viewwwww = self
        
        presenter?.loadUsers()
        presenter?.loadCategories()
        
        
    }
    
    //MARK: - @Objc
    
    @objc private func tapTextFieldButtonRight() {
        
    }
}

//MARK: - Extension

extension UserListViewController {
    
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
            panelCollectionView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 12),
            panelCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -16),
            panelCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            panelCollectionView.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func createTableViewConsrains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: panelCollectionView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createBottomLineCollectionViewConstrains() {
        bottomLineCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLineCollectionView.bottomAnchor.constraint(equalTo: panelCollectionView.bottomAnchor),
            bottomLineCollectionView.trailingAnchor.constraint(equalTo: panelCollectionView.trailingAnchor),
            bottomLineCollectionView.leadingAnchor.constraint(equalTo: panelCollectionView.leadingAnchor),
            
            bottomLineCollectionView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension UserListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell else {
            fatalError("The collectionView could not dequeue a CustomCollectionViewCell in VC")
        }
        
        
        
        let category = presenter?.categories[indexPath.row].name
        
        cell.configure(text: category ?? "Errror")
        
        if indexPath.row == selectedIndex {
            cell.configureTextColor(textColor: .black)// Цвет текста для выбранного элемента
            cell.configureBottomLine(isSelected: true)  // Включаем нижнюю линию для выбранного элемента
            cell.configureFontText(text: .boldSystemFont(ofSize: 15))
        } else {
            cell.configureTextColor(textColor: .gray)  // Цвет текста для невыбранных элементов
            cell.configureBottomLine(isSelected: false)  // Отключаем нижнюю линию для невыбранных
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension UserListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        ///1.    Сохраняется старый индекс выбранной ячейки в oldIndexPath.
        ///2.    Обновляется выбранная ячейка: сначала сохраняется новый индекс в selectedIndex, затем перезагружаются старая и новая ячейки с помощью reloadItems(at:).
        let oldIndexPath = IndexPath(row: selectedIndex, section: 0)
        selectedIndex = indexPath.row
        
        collectionView.reloadItems(at: [oldIndexPath, indexPath])
        ///Проще говоря, это нужно, чтобы обновить выделение: подсветить новую ячейку и убрать подсветку со старой.
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension UserListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let text = presenter?.categories[indexPath.row].name
        let maxWidth: CGFloat = 120
        let padding: CGFloat = 25
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)]
        let textWidth = text?.size(withAttributes: attributes).width ?? 0
        let cellWidth = min(textWidth + padding, maxWidth)
        
        return CGSize(width: cellWidth, height: collectionView.bounds.height)
    }
}

//MARK: - UITableViewDataSource

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            fatalError("The TableView could not dequeue a CustomTableViewCell in VC")
        }
        cell.backgroundColor = .white
        
        let employee = presenter?.users[indexPath.row]
        cell.userNameLabel.text = "\(employee?.firstName ?? "Имя") \(employee?.lastName ?? "Фамилия")"
        cell.userCategoriesLabel.text = employee?.position ?? "Должность"
        
        
        
        
        ///Этот кож загружает изображение и обновляет интерфейс.
        ///Если у employee есть строка с URL изображения, и если эту строку можно преобразовать в корректный URL, тогда выполните следующий код.”
        ///Преобразуем строку в URL для загрузки данных.
        ///Нельзя использовать строку напрямую для загрузки данных. Нужно создать объект URL, чтобы сетевые запросы могли работать с ним.
        if let avatarURLString = employee?.avatarURL, let avatarURL = URL(string: avatarURLString) {
            ///Эта задача необходима для загрузки изображения и обновления интерфейса приложения. Без неё вы не получите изображение из сети.
            let task = URLSession.shared.dataTask(with: avatarURL) { data, response, error in
                if let error = error {
                    print("Error loading image: \(error)")
                    return
                }
                
                ///Убедиться, что данные не nil и что они можно преобразовать в изображение, прежде чем использовать их.
                guard let data = data, let image = UIImage(data: data) else {
                    print("No image data")
                    return
                }
                
                ///Чтобы обновить экран, нужно сделать это на главном потоке. DispatchQueue.main.async обеспечивает выполнение кода обновления интерфейса на главном потоке.
                DispatchQueue.main.async {
                    cell.userImageView.image = image
                }
            }
            task.resume()
        } else {
            // Установите изображение по умолчанию, если URL нет
            cell.userImageView.image = UIImage(named: "Max")
            cell.userNameLabel.text = "fefwefwgg"
        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = UserProfile()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}


///Ты пишешь это, чтобы контроллер мог получать данные от презентера и отображать их.
extension UserListViewController: UserListViewProtocol {
    func showCategories(categories: [UserCategory]) {
        self.presenter?.categories = categories
        panelCollectionView.reloadData()
    }
    
    func showUsers(users: [User]) {
        self.presenter?.users = users
        /*
         DispatchQueue.main.async { self.tableView.reloadData() } — это код, который гарантирует, что обновление интерфейса (в данном случае, перезагрузка данных в таблице) происходит на главном потоке.

         Проще говоря:

             •    Все обновления интерфейса нужно делать на главном потоке, чтобы избежать проблем с отображением.
             •    Этот код говорит: “Сделай это обновление позже, на главном потоке”.

         Так что, когда данные загружены, ты используешь этот код, чтобы обновить таблицу и показать новые данные.
         */
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}





#Preview {
    UserListViewController()
}
