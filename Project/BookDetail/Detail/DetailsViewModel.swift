//
//  DetailsViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/22/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import WolmoCore
import ReactiveSwift
import Networking
//import ReactiveCocoa
class DetailsViewModel {
    init() {
        
    }
    public private(set) lazy var action = Action { [unowned self] in
        // do something
        //perform
        return SignalProducer(value:true)
    }
//    public func signUp(_ email: String,
//                       name: String,
//                       password: String,
//                       confirmPassword: String) -> SignalProducer<String, RepositoryError> {
//        let path = SessionRepository.SignUpPath
//        let parameters: [String: Any] = ["email": email,
//                                         "name": name,
//                                         "password": password,
//                                         "confirmPassword": confirmPassword]
//        return performAuthenticationRequest(method: .post, path: path, parameters: parameters) { JSON in
//            let json = JSON as? [String: String]
//            return Result<String, DecodeError>(json?["message"] ?? "")
//            }.mapError { error in
//                switch error {
//                case .requestError(let reqerror):
//                    let myerror = CatscanError.loginError((reqerror.body!["message"] as? String) ?? "")
//                    return RepositoryError.customError(errorName: SessionRepository.CatRepositoryErrorName,
//                                                       error: myerror)
//                default: return error
//                }
//        }
//    }
}
