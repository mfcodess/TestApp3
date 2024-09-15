//
//  User.swift
//  TestApp_3
//
//  Created by Max on 15.09.2024.
//

import Foundation

///Модели для декодирования данных о пользователях, полученных с сервера
// MARK: - Users
struct Users: Codable {
    let items: [User]?
}

// MARK: - Item
struct User: Codable {
    let id: String?
    let avatarURL: String?
    let firstName, lastName, userTag, department: String?
    let position, birthday, phone: String?

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatarUrl"
        case firstName, lastName, userTag, department, position, birthday, phone
    }
}
