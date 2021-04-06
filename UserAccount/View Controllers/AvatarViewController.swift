//
//  AvatarViewController.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-03-28.
//

import UIKit

class AvatarViewController: UIViewController{
    
    
    var FirstName : String = " "
    var LastName: String = " "
    var PhoneNumber: Int? = nil
    var UserEmail: String = " "
    var DateOFBirth: String = " "
    var Age : Int? = nil
    
    var avatarName = ["image1", "image2", "image3"]
        
    var avatar: [UIImage] = [
        UIImage(named: "Image1.png")!,
        UIImage(named: "image2.png")!,
        UIImage(named: "image3.png")!
    ]
    
        
    
    @IBAction func unwindToChooseViewController( sender : UIStoryboardSegue)
    {}
    
    @IBAction func button1(){
        
        
    }

    @IBAction func addPersonButton(sender : Any){
        
        let person : Data = Data.init()
        
        
        person.initWithData(theRow: 0, theFirstName: FirstName, theLastName: LastName, theEmail: UserEmail, theAge:  Age!, theDob: DateOFBirth, theNumber: PhoneNumber!, theAvatar: avatarName[0])
        
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let returnCode = mainDelegate.insertIntoDatabase(person: person)
        
        var returnMsg : String = " Person Added! " + "\(FirstName)"
        
        if returnCode == false {
            
            returnMsg = "Person Add Failed"
        }
        
        
        let alertController = UIAlertController(title: "Sqlite add", message: returnMsg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true)
    }
    
    @IBAction func addPersonButton2(sender : Any){
        
        let person : Data = Data.init()
        
        
        person.initWithData(theRow: 0, theFirstName: FirstName, theLastName: LastName, theEmail: UserEmail, theAge:  Age!, theDob: DateOFBirth, theNumber: PhoneNumber!, theAvatar: avatarName[1])
        
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let returnCode = mainDelegate.insertIntoDatabase(person: person)
        
        var returnMsg : String = " Person Added! " + "\(FirstName)"
        
        if returnCode == false {
            
            returnMsg = "Person Add Failed"
        }
        
        
        let alertController = UIAlertController(title: "Sqlite add", message: returnMsg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true)
    }
    
    @IBAction func addPersonButton3(sender : Any){
        
        let person : Data = Data.init()
        
        
        person.initWithData(theRow: 0, theFirstName: FirstName, theLastName: LastName, theEmail: UserEmail, theAge:  Age!, theDob: DateOFBirth, theNumber: PhoneNumber!, theAvatar: avatarName[2])
        
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let returnCode = mainDelegate.insertIntoDatabase(person: person)
        
        var returnMsg : String = " Person Added! " + "\(FirstName)"
        
        if returnCode == false {
            
            returnMsg = "Person Add Failed"
        }
        
        
        let alertController = UIAlertController(title: "Sqlite add", message: returnMsg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     

        // Do any additional setup after loading the view.
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
