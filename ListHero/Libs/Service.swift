//
//  Service.swift
//  ListHero
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Alamofire

class Service {
    private var alamoFireManager: Alamofire.SessionManager
    private var request: Request?
    private var urlQuery: String = ""
    private var paramenters: [String: Any]?
    private var header: [String: String]?
    
    var setURL: String = "" {
        didSet {
            urlQuery = setURL
        }
    }
    
    var setParam: [String: Any] = [:] {
        didSet {
            paramenters = setParam
        }
    }
    
    var setHeader: [String: String] = [:] {
        didSet {
            header = setHeader
        }
    }
    
    init() {
        alamoFireManager = Alamofire.SessionManager.default
        alamoFireManager.session.configuration.timeoutIntervalForRequest = 30
        alamoFireManager.session.configuration.timeoutIntervalForResource = 30
    }
    
    func getData(method: Alamofire.HTTPMethod, success: ((_ axData: Any?) -> ())?, error: ((_ error: Error?) -> Void)?) {
//        request = alamoFireManager.request(
//            urlQuery,
//            method: method,
//            parameters: paramenters,
//            encoding: URLEncoding.default,
//            headers: header
//            ).responseJSON(completionHandler: { (res) in
//                if res.result.isSuccess {
//                    print("callback success")
//                    success?(res.result.value)
//                } else {
//                    print("callback error")
//                    error?(res.result.error)
//                }
//
//            })
        
        request = alamoFireManager.request(
            urlQuery,
            method: method,
            parameters: paramenters,
            encoding: URLEncoding.default,
            headers: header
            ).responseData(completionHandler: { (res) in
                if res.result.isSuccess {
                    print("callback success")
                    success?(res.result.value)
                } else {
                    print("callback error")
                    error?(res.result.error)
                }
            })
    }
    
}
