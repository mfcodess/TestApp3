//
//  EmployeeListViewPresenter.swift
//  TestApp_3
//
//  Created by Max on 13.09.2024.
//

import Foundation

///Что это? Протокол — это как договор. Он говорит, что любой класс, который будет работать с этим протоколом, должен иметь метод showCategories(categories: [EmployeeCategory]).
///Зачем? Это нужно, чтобы презентер мог взаимодействовать с любым классом, который реализует этот “договор”. Например, с ViewController, который будет показывать категории сотрудников.
protocol EmployeeListViewProtocol: AnyObject {
    func showCategories(categories: [EmployeeCategory])
    //func showEmployee(employees: [User])
}

///Что это? Презентер — это класс, который отвечает за логику программы. Он ничего не знает про интерфейс (как это всё будет отображаться), а только готовит данные для отображения.
///Зачем? Мы хотим разделить логику (то, как данные обрабатываются) и отображение (как данные показываются на экране). Это нужно, чтобы код был чистым и простым.
final class EmployeeListViewPresenter {
    ///Презентер не знает про конкретный класс, который будет показывать данные. Он знает только, что этот класс должен соблюдать “договор” (протокол EmployeeListViewProtocol).
    ///weak — чтобы не было утечек памяти. Презентер не должен “удерживать” в памяти экран (ViewController).
    weak var viewController: EmployeeListViewProtocol? ///Связь с View через протокол
    
    ///Что это? Это функция презентера, которая создаёт список категорий и говорит ViewController: “Вот категории, покажи их!”
    ///Зачем? Презентер подготавливает данные (список категорий) и передаёт их во ViewController, чтобы тот показал их на экране.
    func loadCategories() {
        let categories: [EmployeeCategory] = [
            EmployeeCategory(name: "Всi"),
            EmployeeCategory(name: "iOS"),
            EmployeeCategory(name: "Android"),
            EmployeeCategory(name: "Дизайн"),
            EmployeeCategory(name: "QA"),
            EmployeeCategory(name: "HR"),
            EmployeeCategory(name: "Backend"),
            EmployeeCategory(name: "Техпiтримка"),
            EmployeeCategory(name: "Аналiтика")
        ]
        viewController?.showCategories(categories: categories) ///Отправляем данные во View
    }
    
    //    func loadEmployees() {
    //        let employees: [User] = [User(avatarURL: "dwdfqw", firstnName: "fewf", lastName: "fefw")]
    //        view?.showEmployee(employees: employees)
    //    }
}

//MARK: - Проще говоря: Протокол говорит, что нужно делать, презентер готовит данные, а ViewController показывает их на экране.
