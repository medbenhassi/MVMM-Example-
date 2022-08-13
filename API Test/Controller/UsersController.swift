//
//  ViewController.swift
//  API Test
//
//  Created by med on 12/8/2022.
//

import UIKit

class UsersController: UIViewController {
    @IBOutlet weak var userTableview: UITableView!
    
    var listUser = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:  Call function that fetch all users from API
        UserViewModel.shared.fetchUsers { result in
            switch result {
            case .success(let users) :
                print("User are", users)
                self.listUser = users
                self.userTableview.reloadData()
            case .failure(let error) :
                print("Error to fetch user", error)
            }
        }
    }
    
}

extension UsersController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableview.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! userCell
        let user = listUser[indexPath.row]
        cell.setUser(user: user)
        return cell
    }
    
}

