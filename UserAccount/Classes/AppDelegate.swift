//
//  AppDelegate.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-02-08.
//

import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var databaseName : String? = "iosAssignment.db"
    var databasePath: String?
    var people:[Data] = []
    
    let array : [UIImage] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentDir = documentPaths[0]
        
        databasePath = documentDir.appending("/" + databaseName!)
        
        checkAndMakeDB()
        
        readDataFromDB()
        
        return true
    }
    
     
    
    func readDataFromDB(){
        
        people.removeAll()
        
        var db : OpaquePointer? = nil
        
        if sqlite3_open(self.databasePath,&db) == SQLITE_OK {
            
            print("Successfully opened connection to database at \(self.databasePath)")
            
            var queryStatement: OpaquePointer? = nil
            
            var queryStatementString : String? = "select * from entries"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                
                while sqlite3_step(queryStatement) == SQLITE_ROW
                {
                 let id : Int =  Int(sqlite3_column_int(queryStatement, 0))
                 let Fname = sqlite3_column_text(queryStatement, 1)
                 let Lname = sqlite3_column_text(queryStatement, 2)
                 let email = sqlite3_column_text(queryStatement, 3)
                 let age = Int(sqlite3_column_int(queryStatement, 4))
                 let dob = sqlite3_column_text(queryStatement, 5)
                 let pNumber = Int(sqlite3_column_int(queryStatement, 6))
                    
                 let avatar = sqlite3_column_text(queryStatement, 7)
                    
           
                let FirstName = String(cString: Fname!)
                let LastName = String(cString: Lname!)
                let PhoneNum = Int(pNumber)
                let Uemail  = String(cString: email!)
                let Uage =  Int(age)
                let Udob = String(cString:dob!)
                    
                    if avatar == nil {
                        let Uavatar = "image1"
                        
        
                            
                        let data : Data = Data.init()
                       
                    data.initWithData(theRow: id, theFirstName: FirstName, theLastName: LastName, theEmail: Uemail, theAge: Uage, theDob: Udob, theNumber: PhoneNum, theAvatar: Uavatar)
                            
                            people.append(data)
                            
                            print("Query result")
                            print("\(id) | \(FirstName)| \(LastName) | \(Uemail) |\(Uage) |\(Udob) |\(PhoneNum) |\(Uavatar)")
                    }
                    
                    else{
                    
                let Uavatar = String(cString:avatar!)
                    
                let data : Data = Data.init()
               
            data.initWithData(theRow: id, theFirstName: FirstName, theLastName: LastName, theEmail: Uemail, theAge: Uage, theDob: Udob, theNumber: PhoneNum, theAvatar: Uavatar)
                    
                    people.append(data)
                    
                    print("Query result")
                    print("\(id) | \(FirstName)| \(LastName) | \(Uemail) |\(Uage) |\(Udob) |\(PhoneNum) |\(Uavatar)")
                    
                }
                    
                }
                
                sqlite3_finalize(queryStatement)
              
            }
            
            else{
                print("Select query couldn't not be prepared");
            }
            
            sqlite3_close(db)
        }
        
        else{
            
            print("Unable to open the database")
        }
    }
    
    func insertIntoDatabase(person : Data) -> Bool{
        
        var db : OpaquePointer? = nil
        var returnCode :  Bool = true
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK{
            
            var insertStatement : OpaquePointer? = nil
            let InsertStatementString:String = "insert into entries values(NULL,?,?,?,?,?,?,?)"
            
            
            if sqlite3_prepare_v2(db, InsertStatementString,-1, &insertStatement, nil) == SQLITE_OK{
                
                
                let FirstNameStr = person.FirstName! as NSString
                let LastNameStr = person.LastName! as NSString
                let EmailStr = person.userEmail! as NSString
                let AgeStr = String(person.slAge!) as NSString
                let AvatarStr = person.avatar! as NSString
                let NumberStr = String(person.number!) as NSString
                let DobStr = person.dob! as NSString
                
                sqlite3_bind_text(insertStatement, 1, FirstNameStr.utf8String , -1, nil)
                
                sqlite3_bind_text(insertStatement, 2, LastNameStr.utf8String , -1, nil)
                
                sqlite3_bind_text(insertStatement, 3, EmailStr.utf8String , -1, nil)
                sqlite3_bind_text(insertStatement, 4, AgeStr.utf8String , -1, nil)
                sqlite3_bind_text(insertStatement, 5, DobStr.utf8String , -1, nil)
                sqlite3_bind_text(insertStatement, 6, NumberStr.utf8String , -1, nil)
                sqlite3_bind_text(insertStatement, 7, AvatarStr.utf8String , -1, nil)
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row: \(rowID)")
                }
                
                else{
                    
                    print("Could not insert row")
                    returnCode = false
                }
                
                sqlite3_finalize(insertStatement)
            }
            
            else{
                print("Insert statement could not be performed")
                returnCode = false
            }
            
            sqlite3_close(db)
            
        }
        
        else{
            
            print("Unable to open database")
            returnCode = false
        }
        
        
        return returnCode
    }
    
    func checkAndMakeDB(){
        
        var success = false
        
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath!)
        
        if success {
            return
        }
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
    
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

