//
//  APIManager.swift
//  TestApp_3
//
//  Created by Max on 15.09.2024.
//

import Foundation

//MARK: - APIManager
final class APIManager {
    
    static let shared = APIManager()
    
    ///Делаем запрос на сервер и возращаем результат с данными (Users) или ошибку (Error).
    func fetchUsers(completion: @escaping (Result<Users, Error>) -> Void) {
        
        ///Указываем URL, с которого будем получать данные
        let url = "https://stoplight.io/mocks/kode-api/trainee-test/331141861/users"
        
        ///Проверяем что url наш правильный, если нет вызываем ошибку и прерываем выполнение
        guard let url = URL(string: url) else {
            print("Error: invalid URL - \(url)")
            return
        }
        
        ///Создаем запрос
        let request = URLRequest(url: url)
        
        ///Создаем URLSession и выполяннем запрос на сервер
        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            
            ///Проверяем наличие ошибки сетевого запроса
            guard error == nil else {
                print("Error: request")
                completion(.failure(error!))
                return
            }
            
            ///Проверяем, что получены данные
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            ///Декодируем данные в объект Users
            do {
                let users = try JSONDecoder().decode(Users.self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        
        ///Запускаем задачу
        task.resume()
    }
}
