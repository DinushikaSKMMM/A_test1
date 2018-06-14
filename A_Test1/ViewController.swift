//
//  ViewController.swift
//  A_Test1
//
//  Created by MDL on 6/8/18.
//  Copyright © 2018 fit. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       // ApiManager.shared.GetUserFromAPI()
        getData ()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData () {
        let parameters: Parameters = ["id": "2"]
        let URL = "https://jsonplaceholder.typicode.com/users/"
        let header = [
            "Content-Type" : "text/html; charset=UTF-8"
        ]
        Alamofire.request(URL
            ,
        method: .post,
        parameters: parameters,
        encoding: URLEncoding.queryString,
            headers: header            )
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                let userResponse = Response(JSONString: "\(response)")
//               let x = response.result.value
                
                return .success
            }
            .responseJSON { response in
              debugPrint(response)
                
        }
        
        
        
//        Alamofire.request("https://jsonplaceholder.typicode.com/users/1", method: .post, parameters: parameters as? [String : AnyObject], encoding: JSONEncoding.default, headers: [:])
//            .responseJSON { response in switch response.result {
//
//            case .success(let JSON):
//                print("response :-----> ",response)
//            case .failure(let error):
//                print("Request failed with error: \(error)")
//
//                }
//   }
}
}

