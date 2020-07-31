//
//  ViewController.swift
//  Parsing Json
//
//  Created by Adwait Barkale on 31/07/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Storing File URL
        guard let jsonURL = Bundle(for: type(of: self)).path(forResource: "example", ofType: "json")else{
            return
        }
        //Get content in string format from specified URL
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: jsonURL), encoding: String.Encoding.utf8)else{
            return
        }
        //print(jsonString)
        //Convert Json to Native Swift Object
        var person:Person?
        do{
            person = try JSONDecoder().decode(Person.self, from: Data(jsonString.utf8))
        }catch{
            print("Error Occured During Decoding")
        }
        
        guard let result = person else{
            return
        }
        print("JSON Response")
        print("First Name = \(result.first_name)")
        print("Last Name = \(result.last_name)")
        print("Age = \(result.age)")
        print("Country = \(result.country)")
        print("Is_Male = \(result.is_male)")
        print("Subjects = \(result.subjects)")
        
    }

}
//Create Struct that matches the JSON Format(Model)
//Using JSON Decoder that allow swift to automatically parse data for us.

struct Person : Codable{
    var first_name:String
    var last_name:String
    var age:Int
    var is_male:Bool
    var country:String
    var subjects:[String]
    
}
//
//{
// "first_name": "Adwait"
// "age": 22
// "is_male":true
// "country":"India"
// "subjects":[
//    "OOP",
//    "Computer Security"
//    "Machine Learning"
//]
//}
