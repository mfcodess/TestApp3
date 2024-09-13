//
//  EmployeeListViewPresenter.swift
//  TestApp_3
//
//  Created by Max on 13.09.2024.
//

import Foundation

protocol EmployeeListViewProtocol: AnyObject {
    func showCategories(categories: [EmployeeCategory])
    //func showEmployee(employees: [User])
}

final class EmployeeListViewPresenter {
    weak var viewController: EmployeeListViewProtocol?
    
    
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
        viewController?.showCategories(categories: categories)
    }
    
    //    func loadEmployees() {
    //        let employees: [User] = [User(avatarURL: "dwdfqw", firstnName: "fewf", lastName: "fefw")]
    //        view?.showEmployee(employees: employees)
    //    }
}
