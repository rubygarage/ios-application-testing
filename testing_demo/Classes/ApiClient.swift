//
//  ApiClient.swift
//  ios_demo
//
//  Created by jowkame on 10/2/17.
//  Copyright © 2017 jowkame. All rights reserved.
//

import Alamofire

class ApiClient {
    private static let baseUrl = "http://www.recipepuppy.com/api/"
    private static let resultsKey = "results"
    
    class func loadRecepies(ingredients: String, completion: @escaping ((NSArray) -> ())) {
        Alamofire.request(baseUrl + "?i=" + ingredients).responseJSON { response in
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                let array = JSON[resultsKey] as! NSArray
                
                completion(array)
            }
        }
    }
}
