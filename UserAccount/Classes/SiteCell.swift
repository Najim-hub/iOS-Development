//
//  SiteCell.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-03-28.
//

import UIKit

class SiteCell: UITableViewCell {
    
    let FirstName = UILabel()
    let LastName = UILabel()
    let Age = UILabel();
    let Email = UILabel();
    let Number = UILabel();
    let dob = UILabel();
    
    let myImageView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      
        FirstName.textAlignment = .left
        FirstName.font = UIFont.boldSystemFont(ofSize: 30)
        FirstName.backgroundColor = .clear
        FirstName.textColor = .black
        
        
        LastName.textAlignment = .left
        LastName.font = UIFont.boldSystemFont(ofSize: 15)
        LastName.backgroundColor = .clear
        LastName.textColor = .black
        
        
        dob.textAlignment = .left
        dob.font = UIFont.boldSystemFont(ofSize: 15)
        dob.backgroundColor = .clear
        dob.textColor = .black
        
        Number.textAlignment = .left
        Number.font = UIFont.boldSystemFont(ofSize: 15)
        Number.backgroundColor = .clear
        Number.textColor = .black
        
        Email.textAlignment = .left
        Email.font = UIFont.boldSystemFont(ofSize: 15)
        Email.backgroundColor = .clear
        Email.textColor = .blue
        
        Age.textAlignment = .left
        Age.font = UIFont.boldSystemFont(ofSize: 15)
        Age.backgroundColor = .clear
        Age.textColor = .black
        
        
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(FirstName)
        contentView.addSubview(LastName)
        contentView.addSubview(Age)
        contentView.addSubview(Email)
        contentView.addSubview(Number)
        contentView.addSubview(dob)
        contentView.addSubview(myImageView)
        
    }
    
    override func layoutSubviews() {
        FirstName.frame = CGRect(x:100, y: 5, width: 460, height: 30)
        LastName.frame = CGRect(x:100, y: 40, width: 460, height: 20)
        Age.frame = CGRect(x:100, y: 60, width: 460, height: 20)
        Email.frame = CGRect(x:100, y: 80, width: 460, height: 20)
        dob.frame = CGRect(x:100, y: 100, width: 460, height: 20)
        Number.frame = CGRect(x:100, y: 120, width: 460, height: 20)
        myImageView.frame = CGRect(x:5, y:5,width:95, height: 105)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
