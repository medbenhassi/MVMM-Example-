//
//  API.swift
//  API Test
//
//  Created by med on 12/8/2022.
//

import Foundation

class UserViewModel {
    
    static let shared = UserViewModel()
    var usersUrl = "https://gorest.co.in/public/v2/users"
    
    //MARK: - get all users from API
    func fetchUsers(completion: @escaping (Result<Users, Error>) -> ()){
        guard let url = URL(string: usersUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("failed to fetch users", error)
                    return
                }
                guard let data = data else {return}
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    //completion(.success(myusers)
                    completion(.success(users))
                    
                }catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        }.resume()
    } 
}
