//
//  APIController.swift
//  CloudTask
//
//  Created by Baraa on 7/21/18.
//  Copyright © 2018 Cloud Connective. All rights reserved.
//

import Foundation
import ObjectMapper

final class APIController: NSObject, URLSessionDelegate {
    
    static let inst = APIController()
    
    func getDataFromAPI(pageIndex: Int, completion: @escaping Utils.CompletionHandler) {
        
        // setting up auth data
        let PasswordString = "\(Constants.userName):\(Constants.pass)"
        let base64EncodedCredential = PasswordString.toBase64()
        
        // setting up session & session config
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": "Basic \(base64EncodedCredential)"]
        
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        
        let url = URL(string: "https://45.55.43.15:9090/api/machine/?page=\(pageIndex)&size=10")
        
        // make the request
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data, urlRes, err) in
            if (err == nil) {
                // success
                
                let result = String(data: data!, encoding:
                    String.Encoding.ascii)!
                
                NSLog("result: %@", result)
                
                let responseObject = Mapper<BaseObjectMapper>().map(JSONString: result)

                completion(responseObject!, nil)
                    
            } else {
                // err
                
                completion(nil, err?.localizedDescription)
            }
        }

        dataTask.resume()
        
        }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }

    //URLCredential(trust: challenge.protectionSpace.serverTrust!)
    }

