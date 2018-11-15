//
//  UserRepository.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import Result
import Argo
import Curry
import Runes
class UserRepository: AbstractRepository {
    private static let fetchPath = "users"
    
    func fetchUser() -> SignalProducer<[User],  RepositoryError> {
        let path = UserRepository.fetchPath
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
    func fetchUserRents() -> SignalProducer<[User],  RepositoryError> {
        let path = UserRepository.fetchPath
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
    
    
}
