//
//  UIImageView.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/21/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func load(url: String,fetcher: ImageFetcher) {
        DispatchQueue.global().async { [weak self] in
            fetcher.fetchImage(URL(string:url)!).producer.startWithResult { (result) in
                switch result {
                case let .success(img):
                    DispatchQueue.main.async {
                        self?.image = img
                    }
                case let .failure(error):
                    print("Error Finding Image",error)
                }
            }
        }
    }
}
