//
//  ViewController.swift
//  ParserJSON
//
//  Created by Valerio Ferrucci on 01/12/14.
//  Copyright (c) 2014 Valerio Ferrucci. All rights reserved.
//

import UIKit

func StringFromJSON(ao : AnyObject) -> String? {
    return ao as? String
}
func DoubleFromJSON(ao : AnyObject) -> Double? {
    return ao as? Double
}
func DictionaryFromJSON(ao : AnyObject) -> [String: AnyObject]? {
    return ao as? [String: AnyObject]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var error : NSError?

        let filePath : String? = NSBundle.mainBundle().pathForResource("test", ofType: "json")
        let fileData = NSData(contentsOfFile: filePath!, options:.DataReadingUncached, error: &error)
        let json : AnyObject? = NSJSONSerialization.JSONObjectWithData(fileData!, options: NSJSONReadingOptions(0), error: &error)

        if let _json = json as? [AnyObject] {
            
            for jsonItem in _json {
                
                // ogni jsonItem è un dictionary
                if let _jsonItem = jsonItem >>> DictionaryFromJSON {
                    
                    let element = Photo.decode(_jsonItem)
                    
                    println(element!.titolo)
                }
            }
        }
    }
}

