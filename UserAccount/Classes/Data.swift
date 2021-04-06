//
//  Data.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-03-28.
//

import UIKit

class Data: NSObject {
    
    var id : Int?
    
    var slAge : Int?
    
    var FirstName : String?
    
    var LastName: String?
    
    var userEmail: String?
    
    var number : Int?
    
    var dob : String?
    
    var avatar : String?
    
    
    func initWithData(theRow i : Int,theFirstName fn: String, theLastName ln:String,theEmail e:String, theAge a:Int,theDob d:String,theNumber n:Int, theAvatar av:String?){
        
        id = i;
        FirstName = fn;
        LastName = ln;
        userEmail = e;
        number = n;
        dob = d;
        slAge = a;
        avatar = av;
        
    }
    
    
    
    
    
    
}
