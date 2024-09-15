//
//  EmployeeListViewPresenter.swift
//  TestApp_3
//
//  Created by Max on 13.09.2024.
//

import Foundation

///Что это? Протокол — это как договор. Он говорит, что любой класс, который будет работать с этим протоколом, должен иметь метод showCategories(categories: [EmployeeCategory]).
///Зачем? Это нужно, чтобы презентер мог взаимодействовать с любым классом, который реализует этот “договор”. Например, с ViewController, который будет показывать категории сотрудников.
protocol UserListViewProtocol: AnyObject {
    func showCategories(categories: [UserCategory])
    func showUsers(users: [User])
}

///Что это? Презентер — это класс, который отвечает за логику программы. Он ничего не знает про интерфейс (как это всё будет отображаться), а только готовит данные для отображения.
///Зачем? Мы хотим разделить логику (то, как данные обрабатываются) и отображение (как данные показываются на экране). Это нужно, чтобы код был чистым и простым.
final class UserListViewPresenter {
    ///Презентер не знает про конкретный класс, который будет показывать данные. Он знает только, что этот класс должен соблюдать “договор” (протокол EmployeeListViewProtocol).
    ///weak — чтобы не было утечек памяти. Презентер не должен “удерживать” в памяти экран (ViewController).
    weak var viewController: UserListViewProtocol? ///Связь с View через протокол
    
    ///Что это? Это функция презентера, которая создаёт список категорий и говорит ViewController: “Вот категории, покажи их!”
    ///Зачем? Презентер подготавливает данные (список категорий) и передаёт их во ViewController, чтобы тот показал их на экране.
    func loadCategories() {
        let categories: [UserCategory] = [
            UserCategory(name: "Всi"),
            UserCategory(name: "iOS"),
            UserCategory(name: "Android"),
            UserCategory(name: "Дизайн"),
            UserCategory(name: "QA"),
            UserCategory(name: "HR"),
            UserCategory(name: "Backend"),
            UserCategory(name: "Техпiтримка"),
            UserCategory(name: "Аналiтика")
        ]
        viewController?.showCategories(categories: categories) ///Отправляем данные во View
    }
    
    /// Метод для загрузки пользователей с использованием APIManager
    func loadUsers() {

        ///Вызываем метод fetchUsers у APIManager чтобы получить пользователя
        APIManager.shared.fetchUsers { [weak self] result in
            switch result {
            case .success(let responce):
                ///Mы передаем полученных пользователей на экран для отображения.
                let users = responce.items ?? []
                self?.viewController?.showUsers(users: users)
            case .failure:
                print("Error: loading User")
            }
        }
    }
}

//MARK: - Проще говоря: Протокол говорит, что нужно делать, презентер готовит данные, а ViewController показывает их на экране.
