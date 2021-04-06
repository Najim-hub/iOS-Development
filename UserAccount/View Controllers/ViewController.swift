//
//  ViewController.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-02-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblTable : UILabel!
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch: UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        
        let tableFrame : CGRect = lblTable.frame
        
        if tableFrame.contains(touchPoint){
            
            performSegue(withIdentifier: "HomeSegueToTable", sender: self)
        }
        
    }
 */
    
    @IBAction func unwindToHomeViewController( sender : UIStoryboardSegue)
    {}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     
        
        
    }


}

