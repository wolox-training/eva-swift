//
//  SuggestionsViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/16/18.
//  Copyright © 2018 Wolox. All rights reserved.
//
import Foundation
import WolmoCore
import Networking
import ReactiveSwift
import Result

class RentalsViewModel: ImageFetcher {
    private let _rentals = MutableProperty<[
        Rent]>([])
    private var user:User
    public let rentals:Property<[Rent]>
    public let userRepository : UserRepository
    
    init(userRepository : UserRepository = NetworkingBootstrapper.shared.createUserRepository(),user:User ) {
        rentals = Property(_rentals)
        self.user = user
        self.userRepository = userRepository
    }
    
    public func loadRents(){
        self.userRepository.fetchUserRents(userId: user.id)
            .startWithResult {
                [unowned self] result in
                switch result {
                case .success(let rentals) :
                    self._rentals.value = rentals.filter({$0.returnedAt == nil })
                    DispatchQueue.main.async {
                        self.fetchBookImages()
                    }
                case .failure(let error) :
                    print(error)
                }
        }
    }
    
    func fetchBookImages() {
        _rentals.value.forEach({rent  in
            let book = BookViewModel(book: rent.book)
            book.fetchImage(URL(string:book.image)!).producer.startWithResult { (result) in
                print("fetching")
                switch result {
                case let .success(img):
                    book.isLoad = true
                    DispatchQueue.main.async {
                        book.imageLoad = img
                    }
                case let .failure(error):
                    print("Error Finding Image",error)
                }
            }
        })
    }
    
    func getByIndex(index:Int) -> Rent {
        return rentals.value[index]
    }
    
    func getCount() -> Int {
        return rentals.value.count
    }
}
