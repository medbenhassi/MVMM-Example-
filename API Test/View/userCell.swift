//
//  userCell.swift
//  API Test
//
//  Created by med on 12/8/2022.
//

import UIKit

class userCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var disponiblityLabel: UILabel!
    
    // MARK: - set up user cell
    func setUser(user : User) {
        fullNameLabel.text = user.name
        emailLabel.text = user.email
        switch user.gender {
        case .female:
            genderLabel.text = "Female"
            genderLabel.textColor =  .purple
        case .male:
            genderLabel.text = "Male"
            genderLabel.textColor = .blue
        }
        switch user.status {
        case .inactive:
            disponiblityLabel.text = "Inactice"
            disponiblityLabel.textColor = .red
        case .active:
            disponiblityLabel.text = "Active"
            disponiblityLabel.textColor = .green
        }
       
    }

}
