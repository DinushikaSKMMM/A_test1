//
//  ApiManager.swift
//  A_Test1
//
//  Created by MDL on 6/11/18.
//  Copyright © 2018 fit. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    private init (){
        
    }
    let parameters: Parameters = ["id": "2"]
    func GetUserFromAPI(){
        Alamofire.request(URL,
                          method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.queryString)
            
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                _ = Response.self
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
        }
    }
}

