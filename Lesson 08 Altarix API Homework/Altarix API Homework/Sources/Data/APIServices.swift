//
//  APIServices.swift
//  Altarix API Homework
//
//  Created by Sergey Popyvanov on 26.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import Foundation
import Alamofire

final public class APIServices {
    
    public static let shared = APIServices()
    
    private(set) var domain = "https://altgo.altarix.org"
    
    public static let eventMethod = "/api/event"
    
    public func getObject<T:Decodable>(
        method: String,
        params: Parameters,
        handler: @escaping (_ object: T?, _ error: Error?) -> Void) {
       
        let resultURL = domain + method
        
        request(resultURL, parameters: params).responseData(){ response in
            response.result.withValue { data in
                    do {                      
                        let result = try JSONDecoder.init().decode(T.self, from: data)
                        handler(result, nil)
                    } catch (let error) {
                        handler(nil, error)
                    }
                }.withError { error in
                    handler(nil, error)
                }
        }
    }
    
}
    
    


