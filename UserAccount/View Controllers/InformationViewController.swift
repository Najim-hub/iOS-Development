//
//  InformationViewController.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-03-28.
//

import UIKit

class InformationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
var avatar: [UIImage] = [
    UIImage(named: "Image1.png")!,
    UIImage(named: "image2.png")!,
    UIImage(named: "image3.png")!
]
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.people.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        
        let rowNum = indexPath.row
        
        tableCell.FirstName.text = mainDelegate.people[rowNum].FirstName
        tableCell.LastName.text = mainDelegate.people[rowNum].LastName
        tableCell.Age.text = String(mainDelegate.people[rowNum].slAge!)
        tableCell.Email.text = mainDelegate.people[rowNum].userEmail
        tableCell.dob.text = mainDelegate.people[rowNum].dob
        tableCell.Number.text = String(mainDelegate.people[rowNum].number!)
        
        let picker = mainDelegate.people[rowNum].avatar
        
        if picker == "Image1" || picker == "image1"  {
            tableCell.myImageView.image = avatar[0]
        }
        
        else if picker == "image2" {
            tableCell.myImageView.image = avatar[1]
        }
        
       else if picker == "image3" {
            tableCell.myImageView.image = avatar[2]
        }
        
        
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let rowNum = indexPath.row
        
        let alertController = UIAlertController(title: mainDelegate.people[rowNum].FirstName, message: mainDelegate.people[rowNum].userEmail, preferredStyle: .alert)
        
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        mainDelegate.readDataFromDB()
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
