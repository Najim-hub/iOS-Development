//
//  CreateAccountViewController.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-02-08.
//

import UIKit

class CreateAccountViewController: UIViewController , UITextFieldDelegate{
    
    
    
    @IBOutlet var slAge : UISlider!
    @IBOutlet var lbAge : UILabel!
  
    @IBOutlet var FirstName: UITextField!
    @IBOutlet var LastName: UITextField!
    @IBOutlet var PhoneNumber: UITextField!
    @IBOutlet var UserEmail: UITextField!
    @IBOutlet var DateOFBirth: UITextField!

   
    @IBAction override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is AvatarViewController {
            let vc = segue.destination as? AvatarViewController
            
            vc?.FirstName = FirstName.text!
            vc?.LastName = LastName.text!
            vc?.DateOFBirth = DateOFBirth.text!
            vc?.PhoneNumber = Int(PhoneNumber.text!)
            vc?.UserEmail = UserEmail.text!
            vc?.Age = Int(slAge.value)
            
            
        }
    }

   
    
    @IBAction func closeKeyboard(_ sender: UITextField) {
      
         sender.resignFirstResponder()
     }
    
  
    
    @IBAction func showAlertButtonTapped(sender: UIButton) {
        
        
        showName();
        
        
    }
    
    func showName(){
        
        /*
        let alert = UIAlertController(title: "Done", message: "Thank you " + name + " " + email + " for your time", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler:{(alert: UIAlertAction!) in self.lbName.text = self.userName.text!; self.lbName.text = self.userName.text!}))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        
        
      self.present(alert, animated: true, completion: nil)
 
 */
    }
    
    @IBAction func sliderValChange(sender : UISlider){
        
        updateAge()
        
    }
    
    
    
    
    func updateAge(){
        
        let age = slAge.value
        
        let strAge = String(format: "%.f", age)
        
        lbAge.text = strAge
        
        
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        updateAge()
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
